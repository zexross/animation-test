import 'package:flutter/material.dart';

class Styles {
  static const _defaultTextStyle = TextStyle(fontWeight: FontWeight.w500);

  static ThemeData themeData(BuildContext context) {
    return ThemeData(
      primarySwatch: yellow700Swatch,
      primaryColor: Colors.white,
      backgroundColor: Colors.white,
      indicatorColor: Colors.black,
      hintColor: Colors.grey.shade600,
      errorColor: Colors.red.shade500,
      highlightColor: Colors.grey.shade200,
      focusColor: const Color(0xffffca0a),
      disabledColor: Colors.grey.shade300,
      cardColor: Colors.white,
      brightness: Brightness.light,
      buttonTheme: Theme.of(context)
          .buttonTheme
          .copyWith(colorScheme: const ColorScheme.light()),
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
      ),
    );
  }

  static TextTheme textTheme(BuildContext context) {
    return TextTheme(
      headline1: _defaultTextStyle.copyWith(
          fontSize: 33, color: Theme.of(context).indicatorColor),
      headline2: _defaultTextStyle.copyWith(
          fontSize: 25, color: Theme.of(context).indicatorColor),
      headline3: _defaultTextStyle.copyWith(
          fontSize: 16, color: Theme.of(context).indicatorColor),
      headline4: _defaultTextStyle.copyWith(
          fontSize: 18, color: Theme.of(context).indicatorColor),
      headline5: _defaultTextStyle.copyWith(
          fontSize: 14, color: Theme.of(context).indicatorColor),
      bodyText1: _defaultTextStyle.copyWith(
          fontSize: 13, color: Theme.of(context).indicatorColor),
      bodyText2: _defaultTextStyle.copyWith(
          fontSize: 20, color: Theme.of(context).indicatorColor),
      subtitle1: _defaultTextStyle.copyWith(
          fontSize: 12, color: Theme.of(context).hintColor),
      subtitle2: _defaultTextStyle.copyWith(
          fontSize: 10, color: Theme.of(context).hintColor),
    );
  }
}

final Map<int, Color> _yellow700Map = {
  50: const Color(0xFFFFD7C2),
  100: Colors.yellow[100]!,
  200: Colors.yellow[200]!,
  300: Colors.yellow[300]!,
  400: Colors.yellow[400]!,
  500: Colors.yellow[500]!,
  600: Colors.yellow[600]!,
  700: Colors.yellow[800]!,
  800: Colors.yellow[900]!,
  900: Colors.yellow[700]!,
};

final MaterialColor yellow700Swatch =
    MaterialColor(Colors.yellow[700]!.value, _yellow700Map);
