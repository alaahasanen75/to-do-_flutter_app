import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/color_manage.dart';
import 'package:flutter_application_1/core/componant/big_text.dart';
import 'package:flutter_application_1/core/componant/text_formfield.dart';
import 'package:flutter_application_1/core/fonts_manager.dart';
import 'package:flutter_application_1/core/values_managers.dart';
import 'package:flutter_application_1/business%20logic/app_cubit.dart';
import 'package:flutter_application_1/business%20logic/login_cubit.dart';
import 'package:flutter_application_1/business%20logic/state_logincubit.dart';
import 'package:flutter_application_1/presentation/Layout_screen.dart';
import 'package:flutter_application_1/presentation/auth_screens/sign_in_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegesterView extends StatelessWidget {
  RegesterView({super.key});
  TextEditingController emailcontrolar = TextEditingController();
  TextEditingController passwordcontrolar = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginCubitState>(
            builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: 60.h,
                  ),
                  Center(
                    child: Container(
                      height: 150.h,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(
                          'https://images.squarespace-cdn.com/content/v1/57c58c3ae3df28187860a4cb/1a5d927d-4532-48c4-9cc6-97a9cc14a6fc/Artboard+14.png',
                        ),
                      )),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: 10.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Hello',
                            style: TextStyle(
                                fontSize: 40.sp,
                                fontWeight: FontWeight.bold,
                                color: ColorManage.black),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          RichText(
                              text: TextSpan(
                            text: 'Sign into your account',
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: FontSize.s14.sp),
                          ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  TextFormfield(
                      name: TextInputType.emailAddress,
                      controller: emailcontrolar,
                      icon: Icons.email,
                      text: 'Email'),
                  SizedBox(
                    height: 30.h,
                  ),
                  TextFormfield(
                      name: TextInputType.visiblePassword,
                      controller: passwordcontrolar,
                      icon: Icons.password,
                      text: 'Password'),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: RichText(
                          text: TextSpan(
                        text: 'Sign into your account',
                        style: TextStyle(
                            color: Colors.grey[600], fontSize: FontSize.s14.sp),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  InkWell(
                    onTap: () {
                      // formkey.currentState!.validate()

                      LoginCubit.get(context).UseLogin(
                          email: emailcontrolar.text,
                          password: passwordcontrolar.text);

                      LoginCubit.get(context).insertDataBase(
                        phone: LoginCubit.get(context).phone,
                        name: LoginCubit.get(context).name,
                        email: emailcontrolar.text,
                      );
                    },
                    child: Container(
                      height: 50.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          color: ColorManage.Primary),
                      child: Center(
                          child: BigText(
                              text: 'Sign in',
                              color: ColorManage.white,
                              size: AppSize.s20.sp)),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  RichText(
                      text: TextSpan(
                          text: 'Don\'t have an account',
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: FontSize.s15.sp),
                          children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => SignInView())),
                                (route) => true),
                          text: ' Create',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: FontSize.s16.sp,
                              fontWeight: FontWeight.bold),
                        )
                      ])),
                ],
              ),
            ),
          );
        }, listener: (BuildContext context, state) {
          if (state is SuccessfulyLoginShopAppState) {
            if (true) {
              AppCubit.get(context).changeBottonNav(0);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: ((context) => const MainScreen())),
                  (route) => false);
            }
          }

          if (state is ErrorLoginShopAppState) {}
        }));
  }
}
