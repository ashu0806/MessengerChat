import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_constant.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    primaryColor: AppConstant.primaryColor,
    canvasColor: const Color.fromARGB(255, 226, 200, 53),
    cardTheme: const CardTheme(
      color: AppConstant.secondaryColor,
    ),
    primaryColorDark: AppConstant.primaryColordark,
    iconTheme: const IconThemeData(
      color: AppConstant.appBlack,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.blueGrey,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
    ),
    appBarTheme: const AppBarTheme(
      color: AppConstant.appwhite,
    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    cardColor: AppConstant.appwhite,
    unselectedWidgetColor: Colors.black45,
    focusColor: AppConstant.primaryColor,
    dividerColor: AppConstant.appwhite,
    textTheme: TextTheme(
      headline1: GoogleFonts.inter(
          color: AppConstant.appBlack,
          fontSize: 30.sp,
          fontWeight: FontWeight.bold),
      headline2: GoogleFonts.inter(
          color: AppConstant.appBlack,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600),
      headline3: GoogleFonts.inter(
          color: AppConstant.appBlack,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500),
      headline4: GoogleFonts.inter(
          color: AppConstant.appBlack,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500),
      headline5: GoogleFonts.inter(
          color: AppConstant.appBlack,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500),
      headline6: GoogleFonts.inter(
          color: AppConstant.appBlack,
          fontSize: 13.sp,
          fontWeight: FontWeight.w400),
      subtitle1: GoogleFonts.inter(
          color: AppConstant.subtitle1color,
          fontSize: 11.sp,
          fontWeight: FontWeight.w300),
      subtitle2: GoogleFonts.inter(
          color: AppConstant.subtitle1color,
          fontSize: 11.sp,
          fontWeight: FontWeight.normal),
    ),
  );

  static final ThemeData dark = ThemeData(
    primaryColor: Colors.black12,
    primaryColorDark: Colors.black,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.black,
    ),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    focusColor: Colors.white,
    dividerColor: AppConstant.appBlack,
    textTheme: TextTheme(
      headline1: GoogleFonts.inter(
        color: AppConstant.appwhite,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
      headline2: GoogleFonts.inter(
        color: AppConstant.appwhite,
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
      ),
      headline3: GoogleFonts.inter(
        color: AppConstant.appwhite,
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
      ),
      headline4: GoogleFonts.inter(
        color: AppConstant.appwhite,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      headline5: GoogleFonts.inter(
        color: AppConstant.appwhite,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      headline6: GoogleFonts.inter(
        color: AppConstant.appwhite,
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
      ),
      subtitle1: GoogleFonts.inter(
        color: AppConstant.subtitle1color,
        fontSize: 11.sp,
        fontWeight: FontWeight.w300,
      ),
      subtitle2: GoogleFonts.inter(
        color: AppConstant.subtitle1color,
        fontSize: 11.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}
