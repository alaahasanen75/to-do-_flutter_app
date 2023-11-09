import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/color_manage.dart';
import 'package:flutter_application_1/core/componant/app_column.dart';
import 'package:flutter_application_1/core/componant/app_icon.dart';
import 'package:flutter_application_1/core/componant/big_text.dart';
import 'package:flutter_application_1/core/componant/expabale_widget.dart';
import 'package:flutter_application_1/core/fonts_manager.dart';
import 'package:flutter_application_1/business%20logic/app_cubit.dart';
import 'package:flutter_application_1/business%20logic/app_states.dart';
import 'package:flutter_application_1/presentation/Layout_screen.dart';
import 'package:flutter_application_1/presentation/order_screens/cart_screen.dart';
import 'package:flutter_application_1/presentation/home_screen/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularView extends StatelessWidget {
  Map<String, dynamic>? e;
  PopularView({required this.e});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, CubitState>(
        builder: (context, state) {
          var cubit = AppCubit.get(context);

          return Scaffold(
            bottomNavigationBar: Container(
              padding:
                  EdgeInsets.only(top: 20, right: 25, left: 25, bottom: 10).r,
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
                              BorderRadius.all(Radius.circular(10)).r),
                      child: Row(children: [
                        GestureDetector(
                          onTap: () {
                            cubit.ChangeQuantity(
                              false,
                            );
                            cubit.DecreaseNumber(e!['id']);
                          },
                          child: Icon(
                            Icons.remove,
                            color: ColorManage.signColor,
                          ),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        BigText(
                            text: '${cubit.Number(e!['id'])}',
                            color: ColorManage.signColor),
                        SizedBox(
                          width: 3,
                        ),
                        GestureDetector(
                          onTap: () {
                            cubit.ChangeQuantity(
                              true,
                            );
                            cubit.IncreaseNumber(e!['id']);
                            print(' increment ${cubit.quantity}');
                          },
                          child: Icon(
                            Icons.add,
                            color: ColorManage.signColor,
                          ),
                        )
                      ]),
                    ),
                    GestureDetector(
                      onTap: () {
                        cubit.AddItem(e!);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            bottom: 8.r, left: 10.r, right: 10.r, top: 12.r),
                        decoration: BoxDecoration(
                            color: ColorManage.Primary,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)).r),
                        child: BigText(
                            text: '\$ ${e!['price']} | Add to cart',
                            color: ColorManage.white),
                      ),
                    )
                  ]),
            ),
            body: Stack(children: [
              Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 280.h,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              '${e!['image']}',
                            ),
                            fit: BoxFit.cover)),
                  )),
              Positioned(
                  left: 20,
                  right: 20,
                  top: 45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          child: AppIcon(icon: Icons.arrow_back),
                          onTap: () => Navigator.of(context)
                                  .pop(MaterialPageRoute(builder: ((context) {
                                return const MainScreen();
                              })))),
                      Stack(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: ((context) {
                                  return CartView();
                                })));
                              },
                              child:
                                  AppIcon(icon: Icons.shopping_cart_outlined)),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: AppIcon(
                              icon: Icons.circle,
                              Size: 18,
                              iconCoror: ColorManage.Primary,
                              backGraundColor: ColorManage.Primary,
                            ),
                          ),
                          cubit.TotalQuantity! > 0
                              ? Positioned(
                                  top: 0,
                                  right: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 1),
                                    child: SmallText(
                                      text: '${cubit.TotalQuantity}',
                                      color: ColorManage.white,
                                      size: 11,
                                    ),
                                  ))
                              : BigText(text: '')
                        ],
                      ),
                    ],
                  )),
              Positioned(
                  left: 0,
                  right: 0,
                  top: 250.h,
                  child: Container(
                    height: 600.h,
                    decoration: BoxDecoration(
                        color: ColorManage.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.r),
                            topRight: Radius.circular(25.r))),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppColumn(
                              text: '${e!['name']}', fontSize: FontSize.s16),
                          SizedBox(
                            height: 10.h,
                          ),
                          BigText(text: 'Introduce', size: FontSize.s16),
                          SizedBox(
                            height: 10.h,
                          ),
                          Expanded(
                            child: ExpandableTextWidget(
                              text:
                                  'For the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chill for at least 30 mins. Will keep chilled for two days.For the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chillFor the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chillFor the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chillFor the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chill',
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ]),
          );
        },
        listener: (BuildContext context, state) {});
  }
}
