import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/color_manage.dart';
import 'package:flutter_application_1/core/componant/big_text.dart';
import 'package:flutter_application_1/core/componant/text_formfield.dart';
import 'package:flutter_application_1/core/fonts_manager.dart';
import 'package:flutter_application_1/business%20logic/login_cubit.dart';
import 'package:flutter_application_1/business%20logic/state_logincubit.dart';
import 'package:flutter_application_1/presentation/Layout_screen.dart';
import 'package:flutter_application_1/presentation/auth_screens/regester_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});
  var formkey = GlobalKey<FormState>();

  TextEditingController emailcontrolar = TextEditingController();
  TextEditingController namecontrolar = TextEditingController();
  TextEditingController phonecontrolar = TextEditingController();
  TextEditingController passwordcontrolar = TextEditingController();
  var images = [
    'https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png',
    'https://cdn4.iconfinder.com/data/icons/various-icons-2/476/Twitter.png',
    'https://cdn4.iconfinder.com/data/icons/various-icons-2/476/Facebook.png'
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginCubit()..createDataBase(),
        child: BlocConsumer<LoginCubit, LoginCubitState>(
            builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: 40.h,
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
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFormfield(
                      name: TextInputType.name,
                      controller: emailcontrolar,
                      icon: Icons.email,
                      text: 'Email'),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFormfield(
                      name: TextInputType.visiblePassword,
                      controller: passwordcontrolar,
                      icon: Icons.password,
                      text: 'Password'),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFormfield(
                      name: TextInputType.phone,
                      controller: phonecontrolar,
                      icon: Icons.phone,
                      text: 'Phone'),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFormfield(
                      name: TextInputType.name,
                      controller: namecontrolar,
                      icon: Icons.person,
                      text: 'Name'),
                  SizedBox(
                    height: 30.h,
                  ),
                  InkWell(
                    onTap: () {
                      if (true) {
                        LoginCubit.get(context).Register(
                          email: emailcontrolar.text,
                          password: passwordcontrolar.text,
                          name: namecontrolar.text,
                          phone: phonecontrolar.text,
                        );
                        LoginCubit.get(context).insertDataBase(
                          phone: phonecontrolar.text,
                          name: namecontrolar.text,
                          email: emailcontrolar.text,
                        );
                      }
                    },
                    child: Container(
                      height: 50.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          color: ColorManage.Primary),
                      child: Center(
                          child: BigText(
                              text: 'Sign Up',
                              color: ColorManage.white,
                              size: 20.sp)),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  RichText(
                      text: TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => RegesterView())),
                                (route) => true),
                          text: 'Have an acount already ?',
                          style: TextStyle(
                              color: Colors.blue, fontSize: FontSize.s16.sp))),
                  SizedBox(
                    height: 16.h,
                  ),
                  RichText(
                      text: TextSpan(
                          text: 'Sign up using one of the following methods ?',
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: FontSize.s14.sp))),
                  SizedBox(
                    height: 7.h,
                  ),
                  Wrap(
                    children: List.generate(
                        3,
                        (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.grey.withOpacity(.2),
                                radius: 30.r,
                                backgroundImage: NetworkImage(
                                  images[index],
                                ),
                              ),
                            )),
                  )
                ],
              ),
            ),
          );
        }, listener: (BuildContext context, state) {
          if (state is SuccessfulyRegisterShopAppState) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: ((context) => const MainScreen())),
                (route) => false);
          }
        }));
  }
}
