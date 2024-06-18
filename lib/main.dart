import 'package:flutter/material.dart';
import 'package:themoviedb/Theme/app_colors.dart';
import 'package:themoviedb/navigation/main_navigation.dart';


void main() {
  runApp(const MyPril());
}

class MyPril extends StatelessWidget {
  static final mainNavigation = MainNavigation();
  const MyPril({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.mainDarkBlue,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.mainDarkBlue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          
        ), 
      ),
      routes: mainNavigation.routes,
      initialRoute: mainNavigation.initialRoute(false),
      onGenerateRoute: mainNavigation.onGenerateRoute,
            );
        }
}