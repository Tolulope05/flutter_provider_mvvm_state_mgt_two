import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm_state_mgt_two/utils/routes/routes_name.dart';
import 'package:flutter_provider_mvvm_state_mgt_two/view/home_screen.dart';
import 'package:flutter_provider_mvvm_state_mgt_two/view/login_screen.dart';

import '../../view/details_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HomeScreen(),
        );
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (BuildContext context) => const Loginscreen(),
        );
      case RoutesName.details:
        return MaterialPageRoute(
          builder: (BuildContext context) => const Detailscreen(),
        );
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
