import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/SRC/Data/Resources/colors/light_colors.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: LightColors.primaryColor,
    onPrimary: LightColors.backgroundColor,
    secondary: LightColors.secondaryButtonColor,
    onSecondary: LightColors.buttonTeXtColor,
    surface: LightColors.backgroundColor,
    onSurface: LightColors.bodyTextColor,
    error: LightColors.errorColor,
    onError: LightColors.lightModeErrorColor,
    onErrorContainer: LightColors.darkErrorColor,
    errorContainer: LightColors.lightModeErrorColor,
    outline: LightColors.darkModeBodyColor,
    tertiaryContainer: LightColors.disableInputColor,
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      color: ColorScheme.light().primary,
      fontFamily: 'Poppins-Regular',
      fontSize: 48,
    ),
    titleMedium: TextStyle(
      color: Colors.black,
      fontFamily: 'Poppins-Regular',
      fontSize: 32.sp,
    ),
    bodyLarge: TextStyle(
      color: ColorScheme.light().onSecondary,
      fontFamily: 'Poppins-Regular',
      fontSize: 12.sp,
    ),
    bodyMedium: TextStyle(
      color: ColorScheme.light().onSurface,
      fontFamily: 'Poppins-Regular',
      fontSize: 16,
    ),

    labelMedium: TextStyle(
      color: ColorScheme.light().onSurface,
      fontFamily: 'Poppins-Regular',
      fontSize: 14,
    ),

    bodySmall: TextStyle(
      color: ColorScheme.light().onSecondary,
      fontFamily: 'Poppins-Regular',
      fontSize: 12,
    ),

    titleSmall: TextStyle(
      color: ColorScheme.light().onSurface,
      fontFamily: 'Poppins-SemiBold',
      fontSize: 20,
    ),
    headlineLarge: TextStyle(
      color: ColorScheme.light().error,
      fontFamily: 'Poppins-Regular',
      fontSize: 12,
    ),
    headlineMedium: TextStyle(
      color: ColorScheme.light().primary,
      fontFamily: 'Poppins-SemiBold',
      fontSize: 16,
    ),
    headlineSmall: TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins-Bold',
      fontSize: 12,
    ),

    displayLarge: TextStyle(
      color: ColorScheme.light().onSurface,
      fontFamily: 'Poppins-Bold',
      fontSize: 32,
    ),
    displayMedium: TextStyle(
      color: ColorScheme.light().onSurface,
      fontFamily: 'Poppins-Bold',
      fontSize: 48,
    ),
    displaySmall: TextStyle(
      color: Colors.black,
      fontFamily: 'Poppins-Bold',
      fontSize: 24,
    ),
    labelLarge: TextStyle(
      color: Colors.black,
      fontFamily: 'Poppins-Bold',
      fontSize: 32,
    ),
    labelSmall: TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins-Bold',
      fontSize: 16,
    ),
  ),
  iconTheme: IconThemeData(size: 24, color: ColorScheme.light().onSurface),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: LightColors.disableInputColor,
    contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
    focusColor: LightColors.disableInputColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: LightColors.bodyTextColor),
    ),
  ),
);
