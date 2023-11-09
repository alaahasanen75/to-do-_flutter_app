import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color iconCoror;
  final Color backGraundColor;
  final double Size;
  const AppIcon({
    super.key,
    required this.icon,
    this.iconCoror = const Color(0xFF756d54),
    this.backGraundColor = const Color(0xFFfcf4e4),
    this.Size = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Size,
      height: Size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Size / 2),
          color: backGraundColor),
      child: Icon(
        color: iconCoror,
        icon,
        size: 16.r,
      ),
    );
  }
}
