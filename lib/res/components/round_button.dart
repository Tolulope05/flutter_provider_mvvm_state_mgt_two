import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm_state_mgt_two/res/colors.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    required this.title,
    this.isLoading = false,
    required this.onPress,
  }) : super(key: key);

  final String title;
  final bool isLoading;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.primaryColor,
        ),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Text(
                  title,
                  style: const TextStyle(color: AppColors.whiteColor),
                ),
              ),
      ),
    );
  }
}
