import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pasaraja_mobile/core/constants/constants.dart';
import 'package:pasaraja_mobile/core/sources/data_state.dart';
import 'package:pasaraja_mobile/core/sources/provider_state.dart';
import 'package:pasaraja_mobile/module/customer/controllers/page_controller.dart';
import 'package:pasaraja_mobile/module/customer/models/page/shop_detail_model.dart';
import 'package:pasaraja_mobile/module/customer/models/product_model.dart';
import 'package:pasaraja_mobile/module/customer/models/shop_data_model.dart';

class CustomerShopDetailProvider extends ChangeNotifier {
  ProviderState state = const OnInitState();
  final _pageCont = CustomerPageController();

  ShopDetailModel _shopDetailModel = const ShopDetailModel();

  ShopDetailModel get shopDetail => _shopDetailModel;

  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;

  List<ProductModel> _bestSelling = [];
  List<ProductModel> get bestSelling => _products;

  Future<void> fetchData({required int idShop}) async {
    try {
      state = const OnLoadingState();
      _products = [];
      notifyListeners();

      final dataState = await _pageCont.shopData(idShop: idShop);

      if (dataState is DataSuccess) {
        _shopDetailModel = dataState.data as ShopDetailModel;
        for (var prod in _shopDetailModel.products!) {
          if ((prod.settings?.isAvailable ?? false) == true &&
              (prod.settings?.isShown ?? false)) {
            products.add(prod);
          }
        }
        _bestSelling = _products;

        state = const OnSuccessState();
        notifyListeners();
      }

      if (dataState is DataFailed) {
        state = OnFailureState(
          message: dataState.error?.error.toString() ??
              PasarAjaConstant.unknownError,
        );
        notifyListeners();
      }
    } catch (ex) {
      if (Get.isDialogOpen ?? false) {
        Get.back();
      }
      state = OnFailureState(message: ex.toString());
      notifyListeners();
      Fluttertoast.showToast(msg: ex.toString());
    }
  }
}
