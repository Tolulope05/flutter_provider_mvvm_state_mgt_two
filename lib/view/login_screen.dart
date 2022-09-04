import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm_state_mgt_two/utils/routes/routes_name.dart';
import 'package:flutter_provider_mvvm_state_mgt_two/view/home_screen.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: InkWell(
          onTap: () {
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (_) => const HomeScreen()));

            Navigator.pushNamed(context, RoutesName.home);
          },
          child: const Center(
            child: Text("Loginscreen"),
          ),
        ),
      ),
    );
  }
}
