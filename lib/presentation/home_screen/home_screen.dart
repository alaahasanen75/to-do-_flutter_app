import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/assets_manege.dart';
import 'package:flutter_application_1/core/componant/big_text.dart';
import 'package:flutter_application_1/core/color_manage.dart';
import 'package:flutter_application_1/core/componant/padg_view.dart';
import 'package:flutter_application_1/business%20logic/app_cubit.dart';
import 'package:flutter_application_1/business%20logic/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, CubitState>(
      builder: (context, state) {
        print(MediaQuery.of(context).size.height.toString());
        return Scaffold(
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 45, bottom: 15).r,
                padding: EdgeInsets.only(right: 20, left: 20).r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(
                          text: 'Egypt',
                          color: ColorManage.Primary,
                        ),
                        Row(
                          children: [
                            SmallText(
                              text: 'cairo',
                              color: ColorManage.darkGrey,
                            ),
                            Icon(Icons.arrow_drop_down_rounded)
                          ],
                        )
                      ],
                    ),
                    Center(
                      child: Container(
                          height: 45.h,
                          width: 45.w,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.r)),
                              color: ColorManage.Primary),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.search,
                                color: ColorManage.white,
                              ))),
                    ),
                  ],
                ),
              ),
              Expanded(child: SingleChildScrollView(child: Padge())),
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
