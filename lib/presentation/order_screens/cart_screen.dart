import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/color_manage.dart';
import 'package:flutter_application_1/core/componant/app_icon.dart';
import 'package:flutter_application_1/core/componant/big_text.dart';
import 'package:flutter_application_1/core/componant/constant.dart';
import 'package:flutter_application_1/business%20logic/app_cubit.dart';
import 'package:flutter_application_1/business%20logic/app_states.dart';
import 'package:flutter_application_1/presentation/Layout_screen.dart';
import 'package:flutter_application_1/presentation/home_screen/popular_screen.dart';
import 'package:flutter_application_1/presentation/home_screen/recommended_food.dart';
import 'package:flutter_application_1/presentation/auth_screens/regester_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartView extends StatelessWidget {
  CartView();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, CubitState>(
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        return Scaffold(
          bottomNavigationBar: Container(
            padding:
                const EdgeInsets.only(top: 20, right: 25, left: 25, bottom: 10)
                    .r,
            height: 90.h,
            decoration: BoxDecoration(
                color: ColorManage.buttonBackgroundColor,
                borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35))
                    .r),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        bottom: 7.r, left: 10.r, right: 10.r, top: 10.r),
                    decoration: BoxDecoration(
                        color: ColorManage.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)).r),
                    child: BigText(
                        text: '\$${cubit.Total}', color: ColorManage.signColor),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (token == null) {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: ((context) {
                          return RegesterView();
                        })));
                      } else {
                        cubit.getHistoryList();
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: 8.r, left: 10.r, right: 10.r, top: 12.r),
                      decoration: BoxDecoration(
                          color: ColorManage.Primary,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)).r),
                      child:
                          BigText(text: 'check out', color: ColorManage.white),
                    ),
                  )
                ]),
          ),
          body: Stack(
            children: [
              Positioned(
                top: (40).h,
                left: 20.w,
                right: 20.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: AppIcon(
                        icon: Icons.arrow_back,
                        Size: 34.r,
                        backGraundColor: ColorManage.Primary,
                        iconCoror: ColorManage.white,
                      ),
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: ((context) {
                          return const MainScreen();
                        })));
                      },
                      child: AppIcon(
                        icon: Icons.home_outlined,
                        Size: 34.r,
                        backGraundColor: ColorManage.Primary,
                        iconCoror: ColorManage.white,
                      ),
                    ),
                    AppIcon(
                      icon: Icons.shopping_cart,
                      Size: 34.r,
                      backGraundColor: ColorManage.Primary,
                      iconCoror: ColorManage.white,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: (40).h,
                left: 20.w,
                right: 20.w,
                child: SizedBox(
                  height: 20.h,
                ),
              ),
              ConditionalBuilder(
                condition: cubit.items.isNotEmpty,
                builder: (context) => Positioned(
                  bottom: 0,
                  top: (60).h,
                  left: 20.w,
                  right: 20.w,
                  child: Container(
                    margin: EdgeInsets.only(top: 15.h),
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.separated(
                          itemBuilder: (context, index) => Container(
                                height: 150.h,
                                width: double.maxFinite,
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        cubit.number.containsKey(
                                                cubit.getItem[index].name)
                                            ? Navigator.of(context)
                                                .pushAndRemoveUntil(
                                                    MaterialPageRoute(
                                                        builder: ((context) {
                                                return RecommendedFoogView(
                                                  index:
                                                      cubit.padgnumber(index)!,
                                                  popular: cubit.popular,
                                                  rout: 'card',
                                                );
                                              })), (route) => false)
                                            : Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: ((context) {
                                                  return PopularView(
                                                      e: cubit.card(index));
                                                })),
                                              );
                                      },
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                            Radius.circular(20))
                                                        .r),
                                            height: 120.h,
                                            width: 120.w,
                                            child: cubit.Img(index)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Expanded(
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(.1),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          height: 120.h,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                BigText(
                                                  text:
                                                      '${cubit.getItem[index].name}',
                                                  color: ColorManage
                                                      .mainBlackColor,
                                                ),
                                                SmallText(text: 'Spicy'),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    BigText(
                                                      text:
                                                          '\$${cubit.getItem[index].price}',
                                                      color: Colors.redAccent,
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          bottom: 7.r,
                                                          left: 10.r,
                                                          right: 10.r,
                                                          top: 10.r),
                                                      decoration: BoxDecoration(
                                                          color:
                                                              ColorManage.white,
                                                          borderRadius:
                                                              const BorderRadius
                                                                      .all(
                                                                      Radius.circular(
                                                                          10))
                                                                  .r),
                                                      child: Row(children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            cubit
                                                                .ChangeQuantity(
                                                              false,
                                                            );
                                                            cubit.DecreaseNumber(
                                                                cubit
                                                                    .getItem[
                                                                        index]
                                                                    .id!);
                                                          },
                                                          child: Icon(
                                                            Icons.remove,
                                                            color: ColorManage
                                                                .signColor,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 3,
                                                        ),
                                                        BigText(
                                                            text:
                                                                '${cubit.Number(cubit.getItem[index].id!)}',
                                                            color: ColorManage
                                                                .signColor),
                                                        const SizedBox(
                                                          width: 3,
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            cubit
                                                                .ChangeQuantity(
                                                              true,
                                                            );
                                                            cubit.IncreaseNumber(
                                                                cubit
                                                                    .getItem[
                                                                        index]
                                                                    .id!);
                                                          },
                                                          child: Icon(
                                                            Icons.add,
                                                            color: ColorManage
                                                                .signColor,
                                                          ),
                                                        )
                                                      ]),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          )),
                                    )
                                  ],
                                ),
                              ),
                          separatorBuilder: (context, index) =>
                              Container(height: 1.h),
                          itemCount: cubit.getItem.length),
                    ),
                  ),
                ),
                fallback: (context) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 360.h,
                            child: const Image(
                                image: AssetImage('assets/images/cart2.png'))),
                        SizedBox(
                          height: 10.h,
                        ),
                        BigText(
                          text: 'Your Cart is Empty !',
                          color: ColorManage.signColor,
                          size: 15.sp,
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
