import 'package:flutter/material.dart';
import 'package:themoviedb/Theme/app_colors.dart';
import 'package:themoviedb/widget/auth/auth_widget.dart';
import 'package:themoviedb/widget/auth/main_screen/auth_model.dart';
import 'package:themoviedb/widget/auth/main_screen/main_screen_widget.dart';
import 'package:themoviedb/widget/movie_details/movie_details_widget.dart';

void main() {
  runApp(const MyPril());
}

class MyPril extends StatelessWidget {
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
      routes: {
      '/auth': (context) =>  AuthProvider(
                model: AuthModel(), 
                child: const AuthWidget()),
      '/main_screen':(context) => const MainScreenWidget(),
      '/main_screen/movie_details': (context) {
        final arguments = ModalRoute.of(context)?.settings.arguments;
        if (arguments is int) {
          return MovieDetailsWidget(movieId: arguments);
        }
        else {
          return const MovieDetailsWidget(movieId: 0);
        }
        },
      },
      initialRoute: '/auth',
            );
        }
}