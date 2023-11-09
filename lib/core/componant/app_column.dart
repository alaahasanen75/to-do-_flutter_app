import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/color_manage.dart';
import 'package:flutter_application_1/core/componant/big_text.dart';
import 'package:flutter_application_1/core/componant/icons_widged.dart';
import 'package:flutter_application_1/core/fonts_manager.dart';
import 'package:flutter_application_1/core/values_managers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppColumn extends StatelessWidget {
  final String text;
  double fontSize;
  AppColumn({super.key, required this.text, this.fontSize = FontSize.s17});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text, size: fontSize),
        SizedBox(
          height: 10.h,
        ),
        Container(
          child: Row(
            children: [
              Wrap(
                spacing: 0,
                children: List.generate(5, (index) {
                  return Icon(
                    Icons.star,
                    color: ColorManage.Primary,
                    size: AppSize.s16,
                  );
                }),
              ),
              SizedBox(
                width: 7.w,
              ),
              SmallText(
                text: '2.3',
                color: ColorManage.textcolor,
              ),
              SizedBox(
                width: 7.w,
              ),
              SmallText(
                text: '2345',
                color: ColorManage.textcolor,
              ),
              SizedBox(
                width: 7.w,
              ),
              SmallText(
                text: 'comment',
                color: ColorManage.textcolor,
              )
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconAndText(
                  icon: Icons.circle_sharp,
                  text: 'normal',
                  colorIcon: ColorManage.iconColor1),
              IconAndText(
                  icon: Icons.location_on_outlined,
                  text: '1.7km',
                  colorIcon: ColorManage.Primary),
              IconAndText(
                  icon: Icons.access_time_filled_outlined,
                  text: '32min',
                  colorIcon: ColorManage.iconColor2)
            ],
          ),
        )
      ],
    );
  }
}
