import 'package:flutter/material.dart';
import 'package:themoviedb/Theme/app_colors.dart';
import 'package:themoviedb/widget/auth/auth_widget.dart';
import 'package:themoviedb/widget/auth/main_screen/main_screen_widget.dart';
import 'package:themoviedb/widget/movie_details/movie_details_widget.dart';

void main() {
  runApp(MyPril());
}

class MyPril extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
        backgroundColor: AppColors.mainDarkBlue,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.mainDarkBlue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          
        ), 
      ),
      routes: {
      '/auth': (context) => AuthWidget(),
      '/main_screen':(context) => MainScreenWidget(),
      '/main_screen/movie_details': (context) {
        final arguments = ModalRoute.of(context)?.settings.arguments;
        if (arguments is int) {
          return MovieDetailsWidget(movieId: arguments);
        }
        else {
          return MovieDetailsWidget(movieId: 0);
        }
        },
      },
      initialRoute: '/auth',
            );
        }
}