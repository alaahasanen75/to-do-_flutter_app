import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/color_manage.dart';
import 'package:flutter_application_1/core/componant/big_text.dart';
import 'package:flutter_application_1/core/values_managers.dart';
import 'package:flutter_application_1/presentation/auth_screens/regester_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginImage extends StatelessWidget {
  const LoginImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 360.h,
                child:
                    const Image(image: AssetImage('assets/images/login.jpg'))),
            SizedBox(
              height: 10.h,
            ),
            InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: ((context) => RegesterView())),
                    (route) => true);
              },
              child: Container(
                height: 80.h,
                width: 300.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    color: ColorManage.Primary),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BigText(
                        text: 'Sign in here  ',
                        color: ColorManage.white,
                        size: AppSize.s23.sp),
                    Icon(
                      Icons.login,
                      size: 35,
                      color: ColorManage.white,
                    )
                  ],
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
