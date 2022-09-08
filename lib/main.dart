import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm_state_mgt_two/utils/routes/routes_name.dart';
import 'package:flutter_provider_mvvm_state_mgt_two/view_model/movie_list_view_model.dart';
import 'package:flutter_provider_mvvm_state_mgt_two/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import 'utils/routes/routes.dart';
import 'view_model/auth_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthViewModel>(create: (_) => AuthViewModel()),
          ChangeNotifierProvider<UserViewModel>(create: (_) => UserViewModel()),
          ChangeNotifierProvider<MovieListViewModel>(
            create: (_) => MovieListViewModel(),
          ),
        ],
        builder: (context, child) {
          return MaterialApp(
            title: 'MVVM MASTERY WITH PROVIDER',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.cyan,
            ),
            initialRoute: RoutesName.splash,
            onGenerateRoute: Routes.generateRoute,
          );
        });
  }
}
