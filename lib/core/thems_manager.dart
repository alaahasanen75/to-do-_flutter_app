import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/color_manage.dart';
import 'package:flutter_application_1/core/fonts_manager.dart';
import 'package:flutter_application_1/core/style_manager.dart';
import 'package:flutter_application_1/core/values_managers.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
    ),
    splashColor: ColorManage.lightPrimary,
    primaryColor: ColorManage.Primary,
    primaryColorLight: ColorManage.lightPrimary,
    primaryColorDark: ColorManage.darkPrimary, disabledColor: ColorManage.grey1,

    cardTheme: CardTheme(
        color: ColorManage.white,
        elevation: AppSize.s4,
        shadowColor: ColorManage.grey),
    appBarTheme: AppBarTheme(
      elevation: AppSize.s4,
      centerTitle: true,
      color: ColorManage.Primary,
      shadowColor: ColorManage.lightPrimary,
      titleTextStyle:
          getRegularStyle(color: ColorManage.white, fontSize: AppSize.s16),
    ),
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManage.grey1,
        buttonColor: ColorManage.Primary,
        splashColor: ColorManage.lightPrimary),

    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(
                color: ColorManage.white, fontSize: FontSize.s17),
            backgroundColor: ColorManage.Primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12)))),

    textTheme: TextTheme(
        displayLarge: getBoldStyle(
          color: ColorManage.darkGrey,
        ),
        headlineLarge: getBoldStyle(color: ColorManage.darkGrey, fontSize: 24),
        headlineMedium: getRegularStyle(
            color: ColorManage.darkGrey, fontSize: FontSize.s14),
        titleMedium:
            getMediumStyle(color: ColorManage.Primary, fontSize: FontSize.s16),
        titleSmall:
            getRegularStyle(color: ColorManage.white, fontSize: FontSize.s16),
        bodyLarge: getRegularStyle(color: ColorManage.grey1),
        bodySmall: getRegularStyle(color: ColorManage.grey),
        bodyMedium:
            getRegularStyle(color: ColorManage.grey2, fontSize: FontSize.s12),
        labelSmall:
            getBoldStyle(color: ColorManage.Primary, fontSize: FontSize.s12)),

    inputDecorationTheme: InputDecorationTheme(
        // content padding
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        // hint style
        hintStyle:
            getRegularStyle(color: ColorManage.grey, fontSize: FontSize.s14),
        labelStyle:
            getMediumStyle(color: ColorManage.grey, fontSize: FontSize.s14),
        errorStyle: getRegularStyle(color: ColorManage.error),

        // enabled border style
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManage.grey, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

        // focused border style
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManage.Primary, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

        // error border style
        errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManage.error, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        // focused border style
        focusedErrorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManage.Primary, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)))),
    // label style
  );
}
