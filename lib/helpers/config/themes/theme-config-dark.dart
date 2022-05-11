import 'package:flutter/material.dart';


ThemeData darkTheme(BuildContext context) {
  return ThemeData(
    brightness:  Brightness.dark,
    primaryColor:Color(0xff30465f),
    cursorColor: Colors.white,
    buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary, buttonColor:Color(0xff30465f)),
    primaryColorDark:Color(0xff30465f),
    accentColor: Color(0xff91a0b1),
    //selectedRowColor: Color(0xff30465f),
    //selectedRowColor: Colors.white24,

    selectedRowColor: Colors.grey,
    dividerColor: Colors.grey,
    buttonColor: Color(0xff463bce),
    backgroundColor:Color(0x80f0f2f6),
    cardColor: Color(0xff1d222a),
    scaffoldBackgroundColor: Color(0xff1d222a),
    dialogBackgroundColor: Color(0xff1d222a),
    hintColor: Colors.grey,
    canvasColor:Color(0xff1d222a),
    //shadowColor: Colors.white32,
    shadowColor: Colors.grey[600],
    textSelectionColor:Colors.grey,
    appBarTheme: AppBarTheme(
      color:Color(0xff30465f),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    iconTheme: IconThemeData(
      color:Colors.grey,
    ),
    textSelectionTheme: TextSelectionThemeData(cursorColor:Colors.black,selectionColor: Colors.grey,selectionHandleColor: Colors.black),
    textTheme: Theme.of(context).textTheme.apply(
      bodyColor: Colors.white,
      displayColor: Colors.grey,
    ),
    primaryTextTheme: Theme.of(context).textTheme.apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
    toggleableActiveColor: Colors.grey,
  ).copyWith(
      pageTransitionsTheme: PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder> {
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.windows:FadeUpwardsPageTransitionsBuilder(),
          }
      )
  );
}