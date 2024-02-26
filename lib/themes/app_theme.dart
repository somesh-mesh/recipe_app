import 'package:flutter/material.dart';

class AppTheme {
  ThemeData get purpleTheme => ThemeData(
      primaryColor: Colors.grey[200],
      secondaryHeaderColor: Colors.greenAccent,
      cardColor: Colors.greenAccent,
      hintColor:  Colors.greenAccent,
      canvasColor: Colors.greenAccent,
      hoverColor: Colors.greenAccent,
      focusColor: Colors.greenAccent,
      indicatorColor: Colors.greenAccent,
      dividerColor: Colors.greenAccent,
      dialogBackgroundColor: Colors.greenAccent,
      highlightColor: Colors.greenAccent,
      primaryColorLight: Colors.greenAccent,
      scaffoldBackgroundColor: Colors.greenAccent,
      shadowColor: const Color(0xa3b2b6b6),
      splashColor: const Color(0xFFf1aa13),
      // textTheme: TextTheme(
      //   displayLarge:
      //   TextStyle(fontFamily: ConstantFont().poppins, fontSize: 17),
      //   displayMedium: TextStyle(
      //       fontFamily: ConstantFont().poppins,
      //       decoration: TextDecoration.underline,
      //       color: Colors.grey,
      //       fontSize: 11),
      //   displaySmall: TextStyle(
      //       fontFamily: ConstantFont().poppins,
      //       color: Colors.black,
      //       fontSize: 15),
      //   headlineLarge: TextStyle(
      //       fontFamily: ConstantFont().poppins,
      //       fontWeight: FontWeight.w500,
      //       color: Colors.black,
      //       fontSize: 15),
      //   headlineMedium: TextStyle(
      //     fontFamily: ConstantFont().poppins,
      //     fontSize: 14,
      //     color: Colors.black,
      //   ),
      //   headlineSmall: TextStyle(
      //       fontFamily: ConstantFont().poppins,
      //       fontSize: 14.5,
      //       color: Colors.grey),
      //   titleLarge: TextStyle(
      //       fontFamily: ConstantFont().poppins,
      //       color: Colors.black,
      //       fontSize: 14,
      //       fontWeight: FontWeight.w700),
      //   titleMedium: TextStyle(
      //       fontFamily: ConstantFont().poppins,
      //       fontWeight: FontWeight.w600,
      //       fontSize: 20),
      //   titleSmall: TextStyle(
      //     fontFamily: ConstantFont().poppins,
      //     color: Colors.black,
      //     fontWeight: FontWeight.w300,
      //   ),
      //   bodyLarge: TextStyle(
      //       color: Colors.black,
      //       fontWeight: FontWeight.w600,
      //       fontSize: 16,
      //       fontFamily: ConstantFont().poppins),
      //   bodyMedium: TextStyle(
      //       fontFamily: ConstantFont().poppins,
      //       fontWeight: FontWeight.w400,
      //       color: Colors.black,
      //       fontSize: 18),
      //   bodySmall: TextStyle(
      //       color: Colors.black,
      //       fontSize: 15,
      //       fontFamily: ConstantFont().poppins),
      //   labelLarge: TextStyle(
      //       fontFamily: ConstantFont().poppins,
      //       fontWeight: FontWeight.bold,
      //       fontSize: 17),
      //   labelMedium: TextStyle(
      //       fontFamily: ConstantFont().poppins,
      //       fontWeight: FontWeight.w500,
      //       color: Colors.grey,
      //       fontSize: 14),
      //
      // ),
      // primaryTextTheme: TextTheme(
      //   displayLarge: TextStyle(
      //       fontFamily: ConstantFont().poppins,
      //       fontWeight: FontWeight.w500,
      //       fontSize: 16,
      //       color: Colors.black),
      //   displayMedium:
      //   TextStyle(fontSize: 17, fontFamily: ConstantFont().poppins),
      //   displaySmall: TextStyle(
      //       fontFamily: ConstantFont().poppins,
      //       fontWeight: FontWeight.w300,
      //       color: Colors.grey[700],
      //       fontSize: 15),
      //   titleSmall: TextStyle(
      //     fontFamily: ConstantFont().poppins,
      //     color: Colors.grey,
      //     fontSize: 14,
      //   ),
      //   headlineMedium: TextStyle(
      //     fontFamily: ConstantFont().poppins,
      //     fontWeight: FontWeight.w600,
      //     color: Colors.white,
      //     fontSize: 14,
      //   ),
      //   titleMedium: TextStyle(
      //       fontFamily: ConstantFont().poppins,
      //       fontWeight: FontWeight.w500,
      //       color: Colors.grey,
      //       fontSize: 15),
      //   headlineLarge: TextStyle(
      //     fontFamily: ConstantFont().poppins,
      //     fontWeight: FontWeight.w400,
      //     fontSize: 16,
      //     color: Colors.black,
      //   ),
      //   headlineSmall: TextStyle(
      //       color: Colors.black,
      //       fontSize: 15,
      //       fontWeight: FontWeight.w600,
      //       fontFamily: ConstantFont().poppins),
      //   titleLarge: TextStyle(fontFamily: ConstantFont().poppins, fontSize: 15),
      //   bodyMedium: TextStyle(
      //       fontFamily: ConstantFont().poppins,
      //       fontSize: 16,
      //       color: Colors.black,
      //       fontWeight: FontWeight.w500),
      //   bodyLarge: TextStyle(
      //       fontFamily: ConstantFont().poppins,
      //       letterSpacing: 0.1,
      //       fontSize: 15,
      //       fontWeight: FontWeight.w600),
      //   bodySmall: TextStyle(
      //       fontFamily: ConstantFont().poppins,
      //       color: Colors.black,
      //       fontSize: 14),
      //   labelMedium: TextStyle(
      //     fontFamily: ConstantFont().poppins,
      //     fontWeight: FontWeight.w700,
      //   ),
      // ),
      // accentTextTheme: TextTheme(
      //     displaySmall: TextStyle(
      //         fontFamily: ConstantFont().poppins,
      //         fontSize: 11,
      //         color: ConstantColors().gridColor612,
      //         fontWeight: FontWeight.w600),
      //     displayLarge: TextStyle(
      //         fontFamily: ConstantFont().poppins,
      //         fontSize: 18,
      //         fontWeight: FontWeight.bold,
      //         color: Colors.black),
      //     displayMedium: TextStyle(
      //         fontFamily: ConstantFont().poppins,
      //         fontSize: 15,
      //         color: Colors.black,
      //         fontWeight: FontWeight.w500),
      //     bodySmall: const TextStyle(color: Colors.white),
      //     titleSmall: TextStyle(
      //       fontFamily: ConstantFont().poppins,
      //     ),
      //   headlineSmall: TextStyle(
      //       fontFamily: ConstantFont().poppins,
      //       color: Colors.black,
      //       fontWeight: FontWeight.w500,
      //       fontSize: 12),
      //   headlineMedium: TextStyle(
      //       fontFamily: ConstantFont().poppins,
      //       color: Colors.black,
      //       fontWeight: FontWeight.w400,
      //       fontSize: 12),
      // ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor:
              MaterialStateProperty.all<Color>(Colors.transparent),
              shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  )))),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: const Color(0xFF21ffc3),
        primaryContainer: const Color(0xFF535e81),
        onPrimaryContainer: const Color(0xFF576284),
        secondaryContainer: const Color(0xFFd3e1ea),
        onSecondary: const Color(0xFFcddbe4),
        tertiary: const Color(0xFF0e1f3e),
        onTertiary: const Color(0xFFf8f8ff),
        tertiaryContainer: const Color(0xFFecfff4),
        onTertiaryContainer: const Color(0xFF5856d6),
        // surface: const Color(0xFF1baa5a),
        surfaceVariant: const Color(0xFFfff6eb),
        outline: const Color(0xfff1c0a5),
        shadow: const Color(0xFF728bb8),
        inversePrimary: const Color(0xFFd3e1ea),
        inverseSurface: const Color(0xFF425578),
        background: const Color(0xFF405272),
        onBackground: const Color(0xFFbad0de),
      ).copyWith(background: const Color(0xffd3e1ea)));

}