import 'package:flutter/material.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    brightness: Brightness.light,
    //primaryColor: Colors.grey,
    primaryColor: Color(0xFF0A3471),

    buttonTheme: const ButtonThemeData(
        textTheme: ButtonTextTheme.primary, buttonColor: Color(0xFFFF6A14)),
    primaryColorDark: Colors.white,
    accentColor: const Color(0xFF0A3471),

    //selectedRowColor: Color(0xFF026072),
    selectedRowColor: const Color(0xFF3C5896),
    dividerColor: Colors.grey,
    buttonColor: const Color(0xFFFF6A14),
    backgroundColor: Colors.white,
    cardColor: Colors.white,
    dialogBackgroundColor: Colors.white,
    hintColor: Colors.grey,

    listTileTheme: ListTileThemeData(
        // selectedTileColor:
        selectedColor: Colors.black,
        selectedTileColor: Color(0xFF3C5896)),
    indicatorColor: const Color(0xFF3C5896),
    canvasColor: Colors.white,
    shadowColor: Colors.grey,
    cardTheme: const CardTheme(),
    bottomAppBarTheme: BottomAppBarTheme(color: Color(0xFF3C5896)),

    appBarTheme: AppBarTheme(
        //color: Color(0xFF0D3AC1),
        // color: Color(0xFF3C5896),
        color: Colors.white,
        //color: Colors.grey.withAlpha(100),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.black,
        ),
        centerTitle: true),
    primaryIconTheme: const IconThemeData(color: Colors.grey),
    progressIndicatorTheme:
        ProgressIndicatorThemeData(color: Color(0xFF3C5896)),
    iconTheme: const IconThemeData(
      color: Colors.grey,
    ),
    //splashColor: Color(0xFF0D3AC1),
    splashColor: const Color(0xFF3C5896),
    textSelectionTheme: Theme.of(context).textSelectionTheme.copyWith(
        cursorColor: Colors.grey,
        selectionColor: Colors.grey,
        selectionHandleColor: Colors.grey),

    textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.black,
          displayColor: Colors.grey,
        ),
    primaryTextTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.black,
        ),
    toggleableActiveColor: Colors.grey,
  ).copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
        }),
  );
}
