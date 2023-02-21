import 'package:flutter/material.dart';
import 'package:foods_app_api/utils/color.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  const CustomButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: MyColors.C_70B9BE),
        width: double.infinity,
        height: 54,
        child: const Center(
          child: Text(
            'Apply Filter',
          ),
        ),
      ),
    );
  }
}