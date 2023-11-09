import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/componant/big_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color colorIcon;
  const IconAndText(
      {super.key,
      required this.icon,
      required this.text,
      required this.colorIcon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: colorIcon,
        ),
        SizedBox(
          width: 4.w,
        ),
        SmallText(
          text: text,
        )
      ],
    );
  }
}
