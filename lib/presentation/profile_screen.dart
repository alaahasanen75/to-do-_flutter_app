import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/color_manage.dart';
import 'package:flutter_application_1/core/componant/acount_widget.dart';
import 'package:flutter_application_1/core/componant/app_icon.dart';
import 'package:flutter_application_1/core/componant/big_text.dart';
import 'package:flutter_application_1/business%20logic/app_cubit.dart';
import 'package:flutter_application_1/business%20logic/app_states.dart';
import 'package:flutter_application_1/business%20logic/login_cubit.dart';
import 'package:flutter_application_1/business%20logic/state_logincubit.dart';
import 'package:flutter_application_1/presentation/auth_screens/regester_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManage.Primary,
        title: Center(
          child: Text(
            'Profile',
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Container(
              width: 140.r,
              height: 140.r,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(140.r / 2),
                  color: ColorManage.Primary),
              child: Icon(
                color: ColorManage.white,
                Icons.person,
                size: 80.r,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            BlocBuilder<LoginCubit, LoginCubitState>(builder: (context, state) {
              var cubit = LoginCubit.get(context);
              return MyWidget(
                  appIcon: Container(
                    width: 30.r,
                    height: 30.r,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r / 2),
                        color: ColorManage.Primary),
                    child: Icon(
                      color: ColorManage.white,
                      Icons.person,
                      size: 18.r,
                    ),
                  ),
                  bigText: BigText(text: '${cubit.user['name']}'));
            }),
            SizedBox(
              height: 20.h,
            ),
            BlocBuilder<LoginCubit, LoginCubitState>(builder: (context, state) {
              var cubit = LoginCubit.get(context);
              return MyWidget(
                  appIcon: Container(
                    width: 30.r,
                    height: 30.r,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r / 2),
                        color: ColorManage.yellowColor),
                    child: Icon(
                      color: ColorManage.white,
                      Icons.phone,
                      size: 18.r,
                    ),
                  ),
                  bigText: BigText(text: '${cubit.user['phone']}'));
            }),
            SizedBox(
              height: 20.h,
            ),
            BlocBuilder<LoginCubit, LoginCubitState>(builder: (context, state) {
              var cubit = LoginCubit.get(context);
              return MyWidget(
                  appIcon: Container(
                    width: 30.r,
                    height: 30.r,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r / 2),
                        color: ColorManage.yellowColor),
                    child: Icon(
                      color: ColorManage.white,
                      Icons.email_outlined,
                      size: 18.r,
                    ),
                  ),
                  bigText: BigText(text: '${cubit.user['email']}'));
            }),
            SizedBox(
              height: 20.h,
            ),
            MyWidget(
                appIcon: Container(
                  width: 30.r,
                  height: 30.r,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r / 2),
                      color: ColorManage.yellowColor),
                  child: Icon(
                    color: ColorManage.white,
                    Icons.location_on,
                    size: 18.r,
                  ),
                ),
                bigText: BigText(text: 'Adress')),
            SizedBox(
              height: 20.h,
            ),
            MyWidget(
                appIcon: Container(
                  width: 30.r,
                  height: 30.r,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r / 2),
                      color: Colors.redAccent),
                  child: Icon(
                    color: ColorManage.white,
                    Icons.message_outlined,
                    size: 18.r,
                  ),
                ),
                bigText: BigText(text: 'Massage')),
            SizedBox(
              height: 20.h,
            ),
            BlocBuilder<AppCubit, CubitState>(
              builder: (context, state) {
                return InkWell(
                  onTap: () {
                    AppCubit.get(context).LogOut(context);
                  },
                  child: MyWidget(
                      appIcon: Container(
                        width: 30.r,
                        height: 30.r,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r / 2),
                            color: Colors.redAccent),
                        child: Icon(
                          color: ColorManage.white,
                          Icons.logout,
                          size: 18.r,
                        ),
                      ),
                      bigText: BigText(text: 'LogOut')),
                );
              },
            ),
            SizedBox(
              height: 10.h,
            )
          ],
        ),
      ),
    );
  }
}
