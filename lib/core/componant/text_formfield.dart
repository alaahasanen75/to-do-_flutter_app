import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/color_manage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormfield extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final IconData icon;
  final TextInputType name;
  TextFormfield(
      {super.key,
      required this.controller,
      required this.icon,
      required this.name,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
              prefixIcon: Icon(
                icon,
                color: ColorManage.yellowColor,
              ),
              hintText: text,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide:
                      BorderSide(color: ColorManage.Primary, width: 1.w)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide: BorderSide(
                      color: ColorManage.grey.withOpacity(.4), width: 1.w)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
              )),
          keyboardType: TextInputType.name,
          validator: (value) {
            if (value!.isEmpty) {
              return '${text} must not be empty ';
            }
            return null;
          }),
    );
  }
}
