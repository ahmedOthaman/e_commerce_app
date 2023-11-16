import 'package:flutter/material.dart';

class MyTheme{

  static Color whiteColor=Color(0xffFFFFFF);
  static Color blackColor=Color(0xff000000);
  static Color mainColor=Color(0xff004182);
  static Color textColor=Color(0xff06004F);
//static Color geryColor=Color(0xff000000);

  static ThemeData lightTheme=ThemeData(
    primaryColor: mainColor,
  bottomNavigationBarTheme:  BottomNavigationBarThemeData(
      selectedItemColor: whiteColor,
      unselectedItemColor: mainColor,
      showUnselectedLabels: false,
      backgroundColor: textColor,
      elevation: 0
),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 20,
        color: MyTheme.mainColor,

      ),
      titleMedium: TextStyle(
        fontSize: 18,
        color: MyTheme.whiteColor,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        color: MyTheme.textColor,
      )
    ),

  );
}