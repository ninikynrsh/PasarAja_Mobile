import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pasaraja_mobile/config/themes/colors.dart';
import 'package:pasaraja_mobile/firebase_options.dart';
import 'package:pasaraja_mobile/core/services/google_signin_services.dart';
import 'package:pasaraja_mobile/module/auth/providers/providers.dart';
import 'package:pasaraja_mobile/module/customer/provider/providers.dart';
import 'package:pasaraja_mobile/module/merchant/providers/providers.dart';
import 'package:pasaraja_mobile/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // auth
        ChangeNotifierProvider(create: (context) => GoogleSignService()),
        ChangeNotifierProvider(create: (context) => WelcomeProvider()),
        ChangeNotifierProvider(create: (context) => ChangePasswordProvider()),
        ChangeNotifierProvider(create: (context) => ChangePinProvider()),
        ChangeNotifierProvider(create: (context) => SignInGoogleProvider()),
        ChangeNotifierProvider(create: (context) => SignInPhoneProvider()),
        ChangeNotifierProvider(create: (context) => SignUpFirstProvider()),
        ChangeNotifierProvider(create: (context) => SignUpSecondProvider()),
        ChangeNotifierProvider(create: (context) => SignUpThirdProvider()),
        ChangeNotifierProvider(create: (context) => SignUpFourthProvider()),
        ChangeNotifierProvider(create: (context) => VerifyOtpProvider()),
        ChangeNotifierProvider(create: (context) => VerifyPinProvider()),
        // customer
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => ProfileCustomerProvider()),
        ChangeNotifierProvider(create: (context) => EditAccountCustomerProvider()),
        ChangeNotifierProvider(create: (context) => UpdatePhotoProfileCustomerProvider()),
        // merchant
        ChangeNotifierProvider(create: (context) => MyShopProvider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => UpdatePhotoProfileProvider()),
        ChangeNotifierProvider(create: (context) => EditAccountProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => AddProductProvider()),
        ChangeNotifierProvider(create: (context) => EditProductProvider()),
        ChangeNotifierProvider(create: (context) => CropPhotoProvider()),
        ChangeNotifierProvider(create: (context) => BestSellingProvider()),
        ChangeNotifierProvider(create: (context) => ReviewProvider()),
        ChangeNotifierProvider(create: (context) => ComplainProvider()),
        ChangeNotifierProvider(create: (context) => UnavailableProvider()),
        ChangeNotifierProvider(create: (context) => HiddenProvider()),
        ChangeNotifierProvider(create: (context) => RecommendedProvider()),
        ChangeNotifierProvider(create: (context) => DetailProductProvider()),
        ChangeNotifierProvider(create: (context) => DetailListProvider()),
        ChangeNotifierProvider(create: (context) => ChooseCategoriesProvider()),
        ChangeNotifierProvider(create: (context) => QrScanProvider()),
        ChangeNotifierProvider(create: (context) => ChooseProductProvider()),
        ChangeNotifierProvider(create: (context) => AddPromoProvider()),
        ChangeNotifierProvider(create: (context) => EditPromoProvider()),
        ChangeNotifierProvider(create: (context) => DetailPromoProvider()),
        ChangeNotifierProvider(create: (context) => PromoProvider()),
        ChangeNotifierProvider(create: (context) => PromoActiveProvider()),
        ChangeNotifierProvider(create: (context) => PromoSoonProvider()),
        ChangeNotifierProvider(create: (context) => PromoExpiredProvider()),
        ChangeNotifierProvider(create: (context) => OrderCancelCustomerProvider()),
        ChangeNotifierProvider(create: (context) => OrderCancelMerchantProvider()),
        ChangeNotifierProvider(create: (context) => OrderConfirmedProvider()),
        ChangeNotifierProvider(create: (context) => OrderExpiredProvider()),
        ChangeNotifierProvider(create: (context) => OrderFinishedProvider()),
        ChangeNotifierProvider(create: (context) => OrderInTakingProvider()),
        ChangeNotifierProvider(create: (context) => OrderRequestProvider()),
        ChangeNotifierProvider(create: (context) => OrderSubmittedProvider()),
        ChangeNotifierProvider(create: (context) => OrderDetailProvider()),
        ChangeNotifierProvider(create: (context) => OrderCancelProvider()),
      ],
      child: GetMaterialApp(
        title: 'PasarAja',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: PasarAjaColor.green2,
            background: Colors.white,
          ),
          appBarTheme: const AppBarTheme(
            surfaceTintColor: Colors.white,
          ),
          dialogBackgroundColor: Colors.white,
          dialogTheme: const DialogTheme(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
          ),
          datePickerTheme: const DatePickerThemeData(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            headerBackgroundColor: Colors.white,
            confirmButtonStyle: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(PasarAjaColor.green2),
              foregroundColor: MaterialStatePropertyAll(PasarAjaColor.white),
            ),
            cancelButtonStyle: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(PasarAjaColor.red2),
              foregroundColor: MaterialStatePropertyAll(PasarAjaColor.white),
            ),
          ),
          bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
          ),
        ),
        // home: const listview_kategori(),
        home: const SplashScreen(),
      ),
    );
  }
}
