import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:praktikum/util/color.dart';

final myTextTheme = TextTheme(
  headline1: GoogleFonts.urbanist(
      fontSize: 77, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.urbanist(
      fontSize: 48, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3: GoogleFonts.urbanist(
      fontSize: 38, fontWeight: FontWeight.w600, color: MyColor.dark),
  headline4: GoogleFonts.urbanist(
      fontSize: 27, fontWeight: FontWeight.w600, letterSpacing: 0.25, color: MyColor.dark),
  headline5: GoogleFonts.urbanist(fontSize: 22, fontWeight: FontWeight.w400),
  headline6: GoogleFonts.urbanist(
      fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  bodyText1: GoogleFonts.urbanist(
      fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.urbanist(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.urbanist(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: MyColor.white,
      letterSpacing: 1.25),
);