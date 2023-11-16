import 'package:e_comerce/ui/home/home/home.dart';
import 'package:e_comerce/ui/home/home_tabs/home_screen.dart';
import 'package:e_comerce/ui/login/login_screen.dart';
import 'package:e_comerce/ui/register/register_screen.dart';
import 'package:e_comerce/ui/splash/splash_screen.dart';
import 'package:e_comerce/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'E-commerce',
         theme: MyTheme.lightTheme,
          initialRoute:Home.routeName ,
          routes: {
            LoginScreen.routeName:(context)=>LoginScreen(),
            RegisterScreen.routeName:(context)=>RegisterScreen(),
            Home.routeName:(context)=>Home(),
          },
        );
      },
    );
  }
}

