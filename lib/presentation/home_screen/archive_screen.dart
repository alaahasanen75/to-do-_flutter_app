import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/color_manage.dart';
import 'package:flutter_application_1/core/componant/app_icon.dart';
import 'package:flutter_application_1/core/componant/big_text.dart';
import 'package:flutter_application_1/core/shard.dart';
import 'package:flutter_application_1/business%20logic/app_cubit.dart';
import 'package:flutter_application_1/business%20logic/app_states.dart';
import 'package:flutter_application_1/models/card_model.dart';
import 'package:flutter_application_1/presentation/order_screens/cart_screen.dart';
import 'package:flutter_application_1/presentation/home_screen/popular_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ArchiveView extends StatelessWidget {
  const ArchiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, CubitState>(
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
            body: ConditionalBuilder(
          condition: cubit.history.isNotEmpty,
          builder: (context) => Column(children: [
            Container(
              height: 60.h,
              padding: EdgeInsets.only(top: 10.h),
              color: ColorManage.Primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BigText(
                      text: 'Your Cart History',
                      color: ColorManage.white,
                      size: 15.sp),
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 27.r,
                    color: ColorManage.white,
                  )
                ],
              ),
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.only(top: 15.h, left: 15.w, right: 15.w),
              child:
                  ListView(physics: const BouncingScrollPhysics(), children: [
                for (int i = cubit.gethistory.length - 1; i >= 0; i--)
                  Container(
                    margin: EdgeInsets.only(bottom: 20.h),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          BigText(
                              text: DateFormat('dd-MM-yyy hh:mm a').format(
                                  DateTime.parse(
                                      cubit.gethistory[i][0].time!))),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Wrap(
                                  direction: Axis.horizontal,
                                  children: List.generate(
                                      cubit.gethistory[i].length > 3
                                          ? 3
                                          : cubit.gethistory[i].length,
                                      (index) => InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: ((context) {
                                                return PopularView(
                                                  e: {
                                                    'id': cubit
                                                        .gethistory[i][index]
                                                        .id,
                                                    'image': cubit
                                                        .gethistory[i][index]
                                                        .img,
                                                    "name": cubit
                                                        .gethistory[i][index]
                                                        .name,
                                                    "price": cubit
                                                        .gethistory[i][index]
                                                        .price,
                                                  },
                                                );
                                              })));
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              20.r))),
                                              height: 80,
                                              width: 80,
                                              child: cubit.ImgHistory(i, index),
                                            ),
                                          )),
                                ),
                                Container(
                                  height: 80.h,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SmallText(text: 'total'),
                                      BigText(
                                          text:
                                              '${cubit.gethistory[i].length} Item'),
                                      InkWell(
                                        onTap: () {
                                          cubit.gethistory[i]
                                              .forEach((element) {
                                            cubit.items.putIfAbsent(
                                                element.id!,
                                                () => CardItem(
                                                      id: element.id,
                                                      img: element.img,
                                                      isExit: true,
                                                      name: element.name,
                                                      price: element.price,
                                                      time: DateTime.now()
                                                          .toString(),
                                                      quantity:
                                                          element.quantity,
                                                    ));
                                          });
                                          cubit.timeorder =
                                              cubit.gethistory[i][0].time!;
                                          print(
                                              '${cubit.gethistory[i][0].time!} sssssss');
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: ((context) {
                                            return CartView();
                                          })));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4.w),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                              border: Border.all(
                                                  width: 1.w,
                                                  color: ColorManage.Primary)),
                                          child: SmallText(
                                              text: 'one more',
                                              color: ColorManage.Primary),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ])
                        ]),
                  )
              ]),
            ))
          ]),
          fallback: (context) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 360.h,
                    child: const Image(
                        image: AssetImage('assets/images/cart.png'))),
                SizedBox(
                  height: 10.h,
                ),
                BigText(
                  text: 'You didn\'t buy anything so far !',
                  color: ColorManage.signColor,
                  size: 15.sp,
                )
              ],
            ),
          ),
        ));
      },
      listener: (context, state) {},
    );
  }
}
