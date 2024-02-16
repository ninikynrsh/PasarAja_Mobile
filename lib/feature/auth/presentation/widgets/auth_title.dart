import 'package:flutter/material.dart';
import 'package:pasaraja_mobile/config/themes/typography.dart';

class AuthTitle extends StatelessWidget {
  final String? title;
  const AuthTitle({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? '[judul]',
      textAlign: TextAlign.center,
      style: PasarAjaTypography.sfpdAuthTitle,
    );
  }
}