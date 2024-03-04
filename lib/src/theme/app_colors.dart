import 'package:flutter/material.dart';

abstract class AppColors {
  Color get logoTitle;
  Color get reviewText;
}

class AppColorsDefault implements AppColors {
  @override
  Color get logoTitle => Color(0xFF000000);
  @override
  Color get reviewText => Color(0xFF000000);
}
