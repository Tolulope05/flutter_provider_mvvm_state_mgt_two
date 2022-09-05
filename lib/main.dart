import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm_state_mgt_two/res/colors.dart';
import 'package:flutter_provider_mvvm_state_mgt_two/utils/routes/routes_name.dart';

import 'utils/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVVM MASTERY WITH PROVIDER',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      initialRoute: RoutesName.login,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
