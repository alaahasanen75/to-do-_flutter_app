import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/color_manage.dart';
import 'package:flutter_application_1/core/fonts_manager.dart';
import 'package:flutter_application_1/core/style_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BigText extends StatelessWidget {
  final String? text;
  Color? color;
  double size;

  TextOverflow? textOverflow;
  BigText(
      {this.textOverflow = TextOverflow.ellipsis,
      this.color = const Color(0xff2D2828),
      this.size = FontSize.s17,
      required this.text,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      maxLines: 1,
      style: getBoldStyle(
        color: color!,
        fontSize: size,
        textOverflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class SmallText extends StatelessWidget {
  final String? text;
  Color? color;
  double size;
  double? height;

  SmallText(
      {this.color = const Color(0xff797979),
      this.size = FontSize.s14,
      required this.text,
      this.height = 0,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
          color: color!,
          fontSize: size,
          height: 1.5,
          overflow: TextOverflow.ellipsis),
    );
  }
}
