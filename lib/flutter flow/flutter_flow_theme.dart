import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// แต่งfont
class FlutterFlowTheme {
  static const Color primaryColor = Color(0xff1033FD);
  static const Color secondaryColor = Color(0xffD6D6D6);
  static const Color tertiaryColor = Color(0xffFFFFFFFF);
  static const Color secondaryText = Color(0xffBDBDBD);
  static const Color primaryBackground = Color(0xffEDEDED);

  String primaryFontFamily = 'Mitr';
  String secondaryFontFamily = 'Mitr';

  static TextStyle get title1 => GoogleFonts.getFont(
        'Mitr',
        color: const Color(0xFF727272),
        fontWeight: FontWeight.w600,
        fontSize: 22,
      );
  static TextStyle get title2 => GoogleFonts.getFont(
        'Mitr',
        color: const Color(0xFF000000),
        fontWeight: FontWeight.w500,
        fontSize: 20,
      );
  static TextStyle get title3 => GoogleFonts.getFont(
        'Mitr',
        color: const Color(0xFF727272),
        fontWeight: FontWeight.w500,
        fontSize: 18,
      );
  static TextStyle get subtitle1 => GoogleFonts.getFont(
        'Mitr',
        color: const Color(0xFFFFFFFF),
        fontWeight: FontWeight.w500,
        fontSize: 16,
      );
  static TextStyle get subtitle2 => GoogleFonts.getFont(
        'Mitr',
        color: const Color(0xFF727272),
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );
  static TextStyle get bodyText1 => GoogleFonts.getFont(
        'Mitr',
        color: const Color(0xFFBDBDBD),
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );
  static TextStyle get bodyText2 => GoogleFonts.getFont(
        'Mitr',
        color: const Color(0xFF000000),
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
}

extension TextStyleHelper on TextStyle {
  TextStyle override(
          {String fontFamily = '',
          Color? color,
          double? fontSize,
          FontWeight? fontWeight,
          FontStyle? fontStyle}) =>
      GoogleFonts.getFont(
        fontFamily,
        color: color ?? this.color,
        fontSize: fontSize ?? this.fontSize,
        fontWeight: fontWeight ?? this.fontWeight,
        fontStyle: fontStyle ?? this.fontStyle,
      );
}
