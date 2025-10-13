import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/SRC/Data/Resources/colors/dark_colors.dart';
import 'package:news_app/SRC/Data/Resources/colors/light_colors.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: DarkColors.primaryColor,
    onPrimary: DarkColors.onPrimaryColor,
    secondary: DarkColors.secondaryButtonColor,
    onSecondary: DarkColors.buttonTeXtColor,
    surface: DarkColors.backgroundColor,
    onSurface: DarkColors.bodyTextColor,
    error: DarkColors.darkErrorColor,
    onError: DarkColors.darkModeErrorColor,
    onErrorContainer: DarkColors.errorColor,
    errorContainer: DarkColors.lightModeErrorColor,
    outline: LightColors.darkModeBodyColor,
    tertiaryContainer: DarkColors.disableInputColor,
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      color: ColorScheme.dark().primary,
      fontFamily: 'Poppins-Regular',
      fontSize: 48,
    ),
    titleMedium: TextStyle(
      color: ColorScheme.dark().onSurface,
      fontFamily: 'Poppins-Regular',
      fontSize: 32,
    ),
    bodyLarge: TextStyle(
      color: ColorScheme.dark().surface,
      fontFamily: 'Poppins-Regular',
      fontSize: 12.sp,
    ),
    bodyMedium: TextStyle(
      color: ColorScheme.dark().onSurface,
      fontFamily: 'Poppins-Regular',
      fontSize: 16,
    ),

    labelMedium: TextStyle(
      color: ColorScheme.dark().onSurface,
      fontFamily: 'Poppins-Regular',
      fontSize: 14,
    ),

    bodySmall: TextStyle(
      color: ColorScheme.dark().onSurface,
      fontFamily: 'Poppins-Regular',
      fontSize: 12,
    ),

    titleSmall: TextStyle(
      color: ColorScheme.dark().onSurface,
      fontFamily: 'Poppins-SemiBold',
      fontSize: 20,
    ),
    headlineLarge: TextStyle(
      color: ColorScheme.dark().error,
      fontFamily: 'Poppins-Regular',
      fontSize: 12,
    ),
    headlineMedium: TextStyle(
      color: ColorScheme.dark().primary,
      fontFamily: 'Poppins-SemiBold',
      fontSize: 16,
    ),
    headlineSmall: TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins-Bold',
      fontSize: 12,
    ),

    displayLarge: TextStyle(
      color: ColorScheme.dark().onSurface,
      fontFamily: 'Poppins-Bold',
      fontSize: 32,
    ),
    displayMedium: TextStyle(
      color: ColorScheme.dark().onSurface,
      fontFamily: 'Poppins-Bold',
      fontSize: 48,
    ),
    displaySmall: TextStyle(
      color: ColorScheme.dark().onSurface,
      fontFamily: 'Poppins-Bold',
      fontSize: 24,
    ),
    labelLarge: TextStyle(
      color: ColorScheme.dark().onSurface,
      fontFamily: 'Poppins-Bold',
      fontSize: 32,
    ),
    labelSmall: TextStyle(
      color: ColorScheme.dark().onSurface,
      fontFamily: 'Poppins-Bold',
      fontSize: 16,
    ),
  ),
  iconTheme: IconThemeData(size: 24, color: ColorScheme.dark().onSurface),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    focusColor: Colors.white,
    fillColor: DarkColors.disableInputColor,
    // hoverColor: DarkColors.disableInputColor,
    contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: DarkColors.bodyTextColor),
    ),
  ),
);
