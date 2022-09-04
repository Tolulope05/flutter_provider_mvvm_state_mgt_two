import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm_state_mgt_two/utils/general_utils.dart';
import 'package:flutter_provider_mvvm_state_mgt_two/utils/routes/routes_name.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text("HomeScreen"),
            ),
            ElevatedButton(
              onPressed: () {
                Utils.toastMessage("Hello from Tolucoder!");
              },
              child: const Text("Show Toast"),
            ),
            ElevatedButton(
              onPressed: () {
                Utils.flushErrorMessage("Hello from Tolucoder!", context);
              },
              child: const Text("Show error Flush"),
            ),
            ElevatedButton(
              onPressed: () {
                Utils.snackBar("Hello from Tolucoder!", context);
              },
              child: const Text("Show snack Bar"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.details);
              },
              child: const Text("Navigate to details"),
            ),
          ],
        ),
      ),
    );
  }
}
