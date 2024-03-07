import 'package:flutter/material.dart';

abstract class AppColors {
  Color get logoTitle;
  Color get reviewText;
  Color get reviewTextExperience2;
  Color get selectedOptionsDisable;
  Color get selectedOptionsEnable;
}

class AppColorsDefault implements AppColors {
  @override
  Color get logoTitle => const Color(0xFF000000);
  @override
  Color get reviewText => const Color(0xFF000000);
  @override
  Color get reviewTextExperience2 => const Color(0XFF0057FF);
  @override
  Color get selectedOptionsDisable => const Color(0xFF000000);
  @override
  Color get selectedOptionsEnable => const Color(0xFFFFFFFF);
}
