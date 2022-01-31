import 'dart:math';

import 'package:flutter/material.dart';

import 'colors.dart';

final ThemeData lightTheme = ThemeData(
  primarySwatch: createMaterialColor(kprimaryColor),
);

MaterialColor createMaterialColor(Color color) {
  return MaterialColor(color.value, {
    50: tintColor(color, 0.9),
    100: tintColor(color, 0.8),
    200: tintColor(color, 0.6),
    300: tintColor(color, 0.4),
    400: tintColor(color, 0.2),
    500: color,
    600: shadeColor(color, 0.1),
    700: shadeColor(color, 0.2),
    800: shadeColor(color, 0.3),
    900: shadeColor(color, 0.4),
  });
}

int tintValue(int value, double factor) =>
    max(0, min((value + ((255 - value) * factor)).round(), 255));

Color tintColor(Color color, double factor) => Color.fromRGBO(
    tintValue(color.red, factor),
    tintValue(color.green, factor),
    tintValue(color.blue, factor),
    1);

int shadeValue(int value, double factor) =>
    max(0, min(value - (value * factor).round(), 255));

Color shadeColor(Color color, double factor) => Color.fromRGBO(
    shadeValue(color.red, factor),
    shadeValue(color.green, factor),
    shadeValue(color.blue, factor),
    1);

const kSharpCornerRadius = BorderRadius.all(Radius.circular(8.0));
const kSmoothCornerRadius = BorderRadius.all(Radius.circular(12.0));

///colors
const kMainColor = Color(0xff44AA1D);
const kAppBarColor = kMainColor; //cyan 900
const kButtonChildColor = Colors.white;
const kPageBackgroundColor = Color(0xfff1f8e9); //cyan 50
const kCardBackgroundColor = Colors.white;
const kEnabledColor = Color(0xff50bf25);
const kDisabledColor = Color(0xff90a4ae);
const kLineColor = Colors.black12;
const kLightTextColor = Colors.white;
const kDarkTextColor = Colors.black87;
const kDeleteColor = Color(0xffb50000);
const kCardGreen = Color(0xffdcedc8);
const kCardOrange = Color(0xffffe0b2);
const kCardRed = Color(0xffffebee);

///textStyles
const kWelcomeTextStyle = TextStyle(
  color: kEnabledColor,
  fontWeight: FontWeight.w600,
  fontSize: 20,
);

const kCardHeadingStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 15);

const kCardContentStyle = TextStyle(fontSize: 13.0);

const kCardHeadingTextStyle =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 15);

const kTextFieldDecoration = InputDecoration(
  //   hintText: hintText,
  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
  border: kInputBorder,
  focusedBorder: kFocusedInputBorder,
);

const kFieldHintStyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 18,
  color: kDisabledColor,
);

const kFieldTextStyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 16,
  color: kDarkTextColor,
);

const kAlertTitleStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w600,
  color: kMainColor,
);

const kAlertContentStyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 14,
  color: kDarkTextColor,
);

///Button Styles
ButtonStyle kElevatedButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(kEnabledColor),
    foregroundColor: MaterialStateProperty.all<Color>(kLightTextColor));

ButtonStyle kDisabledElevatedButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(kDisabledColor),
    foregroundColor: MaterialStateProperty.all<Color>(kEnabledColor));

const kButtonTextStyle = TextStyle(
  color: kLightTextColor,
  fontWeight: FontWeight.w500,
  fontSize: 16,
);

ButtonStyle kTextButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(kCardBackgroundColor),
  foregroundColor: MaterialStateProperty.all<Color>(kEnabledColor),
);

const double kMediumSplashRadius = 25.0;

///Padding
const EdgeInsetsGeometry kQRPreviewCardMargin =
    EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0);
const kSingleUserCardPadding = EdgeInsets.all(10.0);
const kWelcomeCardPadding = EdgeInsets.symmetric(horizontal: 12, vertical: 10);
const kWelcomeCardMargin =
    EdgeInsets.only(left: 13.0, top: 10.0, right: 13.0, bottom: 5.0);
const kDashboardGridPadding =
    EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 10);

const Duration kSnackBarDuration = Duration(milliseconds: 1200);

const EdgeInsetsGeometry kDetailPagePadding =
    EdgeInsets.symmetric(horizontal: 10, vertical: 10);
const EdgeInsetsGeometry kFormPadding =
    EdgeInsets.symmetric(horizontal: 12, vertical: 10);
const EdgeInsetsGeometry kFormFieldPadding =
    EdgeInsets.only(top: 8.0, left: 6.0, right: 6.0);
const EdgeInsetsGeometry kCardListPadding =
    EdgeInsets.symmetric(horizontal: 10, vertical: 10);
const EdgeInsetsGeometry kDetailCardPadding =
    EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0);
const EdgeInsetsGeometry kDeletableCardPadding =
    EdgeInsets.only(left: 12.0, top: 12.0, right: 0.0, bottom: 12.0);
const EdgeInsetsGeometry kCardMargin = EdgeInsets.only(bottom: 12.0);

///otherStyles
const kInputBorder = OutlineInputBorder(
  borderSide: BorderSide(),
  borderRadius: kSharpCornerRadius,
);

const kFocusedInputBorder = OutlineInputBorder(
  borderSide: BorderSide(
    width: 2.0,
    color: kMainColor,
  ),
  borderRadius: kSharpCornerRadius,
);

RoundedRectangleBorder kCardBorder =
    const RoundedRectangleBorder(borderRadius: kSmoothCornerRadius);

const kAppWideElevation = 3.0;
