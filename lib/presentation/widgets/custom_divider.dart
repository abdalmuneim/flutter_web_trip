import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  const CustomDivider({super.key, this.height, this.width, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color ?? Colors.white12,
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
