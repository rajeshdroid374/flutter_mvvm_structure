import 'package:flutter/material.dart';

class AppTheme {
  static Color lightBG = const Color(0xFFFFFFFF);
  static String appSemiBoldFont = "AppSemiBold";

  static Map<int, Color> myColor = {
    50: const Color.fromRGBO(17, 112, 217, .1),
    100: const Color.fromRGBO(17, 112, 217, .2),
    200: const Color.fromRGBO(17, 112, 217, .3),
    300: const Color.fromRGBO(17, 112, 217, .4),
    400: const Color.fromRGBO(17, 112, 217, .5),
    500: const Color.fromRGBO(17, 112, 217, .6),
    600: const Color.fromRGBO(17, 112, 217, .7),
    700: const Color.fromRGBO(17, 112, 217, .8),
    800: const Color.fromRGBO(17, 112, 217, .9),
    900: const Color.fromRGBO(17, 112, 217, 1),
  };

  static MaterialColor colorCustom = MaterialColor(0xFF010432, myColor);

  static ThemeData lightTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: AppColor.appPrimaryColor.withOpacity(.5),
      cursorColor: AppColor.appPrimaryColor.withOpacity(.6),
      selectionHandleColor: AppColor.appPrimaryColor.withOpacity(1),
    ),
    fontFamily: "AppRegular",
    primaryColor: colorCustom,
    focusColor: colorCustom,
    scaffoldBackgroundColor: lightBG,
    bottomSheetTheme:
    BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)),
    appBarTheme: const AppBarTheme(
      elevation: 0,
    ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: colorCustom)
        .copyWith(secondary: colorCustom)
        .copyWith(background: Colors.white),
  );
}

class AppColor {
  static Color get white => fromHex('#FFFFFF');
  static Color get black => fromHex('#000000');
  static Color get appBar => fromHex('#311E70');
  static Color get appBarText => fromHex('#404040');
  static Color get defaultSecondColor => fromHex('#4A4A4A');
  static Color get drawerColor1 => fromHex('#311E70');
  static Color get drawerColor2 => fromHex('#130052');
  static Color get red => fromHex('#E84646');
  static Color appPrimaryColor = const Color(0xFF005983);
  static Color appSecondaryColor = const Color(0xFF00486B);
  static Color appSecondaryColor2 = const Color(0xFFFFA571);
  static Color appBlueColor = const Color(0xFF3763EB);
  static Color appButtonColour = const Color(0xFFEFEAF6);
  static Color appLightBlueColor = const Color(0xFFE5EBFE);
  static Color appGreenColor = const Color(0xFF18E3B5);
  static Color appBlackColor = const Color(0xFF0C0C0C);
  static Color appWhiteColor = const Color(0xFFFFFFFF);
  static Color appBg = const Color(0xFFF8F8F8);
  static Color appDividerColor = const Color(0xFFD3D3D3);
  static Color appBackgroundColor = const Color(0xFF010020);

  static Color appFocusBorderColor = const Color(0xFF0C0C0C);
  static Color appUnFocusBorderColor = const Color(0xFF0C0C0C);

  static Color appRedColor = const Color(0xFFBF2F38);
  static Color appRedColorError = const Color(0xFFEA2017);
  static Color appRedLight = const Color(0xFFDD8F82);

  static Color appGrey = const Color(0xFF403F58);
  static Color grey = const Color(0xFF868585);

  static Color appColorYellow = const Color(0xFFFFD600);

  /// TEMPERATURE COLOURS
  static Color tempColor1 = const Color(0xFFf703cc);
  static Color tempColor2 = const Color(0xFFbc18bc);
  static Color tempColor3 = const Color(0xFF0c5f9a);
  static Color tempColor4 = const Color(0xFF1dbcf1);
  static Color tempColor5 = const Color(0xFF9ee6e6);
  static Color tempColor6 = const Color(0xFF3ed096);
  static Color tempColor7 = const Color(0xFFe5e22e);
  static Color tempColor8 = const Color(0xFFdeb41b);
  static Color tempColor9 = const Color(0xFFde8d1b);
  static Color tempColor10 = const Color(0xFFe50b24);
  static Color tempColor11 = const Color(0xFFdb0a68);
  static Color tempColor12 = const Color(0xFFf410e8);

  /// WIND COLOURS
  static Color windColor1 = const Color(0xFFFFE100);
  static Color windColor2 = const Color(0xFFFF9000);
  static Color windColor3 = const Color(0xFFE20000);
  static Color windColor4 = const Color(0xFFFF0098);
  static Color windColor5 = const Color(0xFFC300FF);
  static Color windColor6 = const Color(0xFF49006D);
  static Color windColor7 = const Color(0xFF18003F);

}

Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}
