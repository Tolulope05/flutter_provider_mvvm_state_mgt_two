import 'package:flutter/material.dart';

/// DEMO DETAIL SCREEN
/// - This screen is jst a demo to show standard mvvm navigation
/// - The naviagtion details is seen in the home screen

class Detailscreen extends StatelessWidget {
  const Detailscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
      child: Center(
        child: Text("Demo Details screen"),
      ),
    ));
  }
}
