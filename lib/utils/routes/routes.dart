import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm_state_mgt_two/utils/routes/routes_name.dart';
import 'package:flutter_provider_mvvm_state_mgt_two/view/home_screen.dart';
import 'package:flutter_provider_mvvm_state_mgt_two/view/login_screen.dart';
import 'package:flutter_provider_mvvm_state_mgt_two/view/movies_list_screen.dart';
import 'package:flutter_provider_mvvm_state_mgt_two/view/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HomeScreen(),
        );
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (BuildContext context) => Loginscreen(),
        );
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());
      case RoutesName.movieList:
        return MaterialPageRoute(
            builder: (BuildContext context) => const MovieListScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("No Page Found"),
            ),
          ),
        );
    }
  }
}
