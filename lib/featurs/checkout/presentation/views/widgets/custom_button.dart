import 'package:flutter/material.dart';
import 'package:payment/core/utiles/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.isLoading = false});
  final String title;
  final void Function()? onPressed;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xff34A853),
          borderRadius: BorderRadius.circular(15)),
      height: 80,
      width: double.infinity,
      child: ElevatedButton(
          style: const ButtonStyle(
            elevation: MaterialStatePropertyAll(0),
            backgroundColor: MaterialStatePropertyAll(Color(0xff34A853)),
          ),
          onPressed: onPressed,
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : Text(
                  title,
                  style: Styles.style22,
                )),
    );
  }
}
