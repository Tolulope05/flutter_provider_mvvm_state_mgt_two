import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm_state_mgt_two/res/components/round_button.dart';
import 'package:flutter_provider_mvvm_state_mgt_two/utils/routes/routes_name.dart';

import '../utils/general_utils.dart';

class Loginscreen extends StatelessWidget {
  Loginscreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    print("Full Widget rebuild");
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                focusNode: _emailFocus,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(context, _emailFocus, _passwordFocus);
                },
                decoration: const InputDecoration(
                  hintText: "email",
                  prefixIcon: Icon(Icons.email),
                  labelText: "mail",
                ),
              ),
              ValueListenableBuilder(
                valueListenable: _obscurePassword,
                builder: ((context, value, child) {
                  return TextFormField(
                    controller: _passwordController,
                    focusNode: _passwordFocus,
                    obscureText: _obscurePassword.value,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      hintText: "password",
                      prefixIcon: const Icon(Icons.lock),
                      labelText: "password",
                      suffixIcon: InkWell(
                        onTap: () {
                          _obscurePassword.value = !_obscurePassword.value;
                        },
                        child: Icon(
                          _obscurePassword.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: height * .05),
              RoundButton(
                  title: "Login",
                  onPress: () {
                    if (_emailController.text.isEmpty) {
                      Utils.flushErrorMessage("Please enter email", context);
                    } else if (_passwordController.text.isEmpty) {
                      Utils.flushErrorMessage("Please enter password", context);
                    } else if (_passwordController.text.length < 8) {
                      Utils.flushErrorMessage(
                          "Password must be at least 8 characters", context);
                    } else {
                      print("API hit");
                      Navigator.pushReplacementNamed(context, RoutesName.home);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
