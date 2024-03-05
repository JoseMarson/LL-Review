import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:locallog_client_reviw/src/theme/app_theme.dart';

abstract class AppTextStyles {
  TextStyle get logoTitle;
  TextStyle get reviewText;
  TextStyle get reviewText2;
  TextStyle get reviewText2Name;
  TextStyle get reviewTextExperience;
  TextStyle get reviewTextExperience2;
  TextStyle get selectedOptionsEnable;
  TextStyle get selectedOptionsDisable;
}

class AppTextStylesDefault implements AppTextStyles {
  @override
  TextStyle get logoTitle => GoogleFonts.dmSans(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: AppTheme.colors.logoTitle,
      );
  @override
  TextStyle get reviewText => GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppTheme.colors.reviewText,
      );
  @override
  TextStyle get reviewText2 => GoogleFonts.inter(
        fontSize: 13,
        color: AppTheme.colors.reviewText,
      );
  @override
  TextStyle get reviewText2Name => GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w700,
        color: AppTheme.colors.reviewText,
      );
  @override
  TextStyle get reviewTextExperience => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: AppTheme.colors.reviewText,
      );
  @override
  TextStyle get reviewTextExperience2 => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: AppTheme.colors.reviewTextExperience2,
      );
  @override
  TextStyle get selectedOptionsDisable => GoogleFonts.inter(
        fontSize: 10,
        color: AppTheme.colors.selectedOptionsDisable,
      );
  TextStyle get selectedOptionsEnable => GoogleFonts.inter(
        fontSize: 10,
        color: AppTheme.colors.selectedOptionsEnable,
      );
}
