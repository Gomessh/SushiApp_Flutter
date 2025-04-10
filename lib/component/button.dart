import 'package:flutter/material.dart';
import 'package:sushi_app/theme/colors.dart';

class MainButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const MainButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(40),
        ),
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Button Text
            Text(text, style: TextStyle(color: Colors.white)),

            const SizedBox(width: 10),

            // icon
            Icon(Icons.arrow_forward, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
