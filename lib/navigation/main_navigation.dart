
import 'package:flutter/material.dart';
import 'package:themoviedb/widget/auth/auth_widget.dart';
import 'package:themoviedb/widget/auth/main_screen/auth_model.dart';
import 'package:themoviedb/widget/auth/main_screen/main_screen_widget.dart';
import 'package:themoviedb/widget/movie_details/movie_details_widget.dart';

abstract class MainNavigationRoutesNames {
  static const auth = '/auth';
  static const mainScreen = '/main_screen';
  static const movieDetails = '/main_screen/movie_details';
}



class MainNavigation {
  String initialRoute(bool isAuth) => isAuth ? MainNavigationRoutesNames.mainScreen : MainNavigationRoutesNames.auth;
    final routes = <String, Widget Function (BuildContext)> {
      '/auth': (context) =>  AuthProvider(
                model: AuthModel(), 
                child: const AuthWidget()),
      '/main_screen':(context) => const MainScreenWidget(),
       
    };

    Route<Object> onGenerateRoute(RouteSettings settings) {
      switch (settings.name) {
        case MainNavigationRoutesNames.movieDetails:
        final arguments = settings.arguments;
        final movieId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
          builder: (context) => MovieDetailsWidget(movieId: movieId));
        default: 
        const widget = Text('Navigation error!!!');
        return MaterialPageRoute(builder: (context) => widget);
      }

    }
}