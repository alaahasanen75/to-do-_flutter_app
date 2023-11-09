import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/color_manage.dart';
import 'package:flutter_application_1/core/componant/app_icon.dart';
import 'package:flutter_application_1/core/componant/big_text.dart';
import 'package:flutter_application_1/core/componant/expabale_widget.dart';
import 'package:flutter_application_1/core/fonts_manager.dart';
import 'package:flutter_application_1/business%20logic/app_cubit.dart';
import 'package:flutter_application_1/business%20logic/app_states.dart';
import 'package:flutter_application_1/models/dummy_data.dart';
import 'package:flutter_application_1/presentation/Layout_screen.dart';
import 'package:flutter_application_1/presentation/order_screens/cart_screen.dart';
import 'package:flutter_application_1/presentation/home_screen/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendedFoogView extends StatelessWidget {
  Popular? popular;
  int index;
  String? rout;
  RecommendedFoogView({
    super.key,
    this.popular,
    required this.index,
    this.rout,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, CubitState>(
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          Map<String, dynamic> images = {
            'id': index + 6,
            'image': popular!.bbqs![index].img,
            "name": popular!.bbqs![index].name,
            "price": popular!.bbqs![index].price,
          };

          int tap = images['id'];

          return Scaffold(
            bottomNavigationBar:
                Column(mainAxisSize: MainAxisSize.min, children: [
              Padding(
                padding: const EdgeInsets.only(
                        bottom: 10, left: 20, right: 20, top: 10)
                    .r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        cubit.ChangeQuantity(false);
                        cubit.DecreaseNumber(tap);
                      },
                      child: AppIcon(
                          icon: Icons.remove,
                          iconCoror: ColorManage.white,
                          backGraundColor: ColorManage.Primary),
                    ),
                    BigText(
                        text:
                            '\$${popular!.bbqs![index].price!} x ${cubit.Number(images['id'])}    ',
                        size: 20.sp,
                        color: ColorManage.mainBlackColor),
                    GestureDetector(
                      onTap: () {
                        cubit.ChangeQuantity(true);
                        cubit.IncreaseNumber(tap);
                      },
                      child: AppIcon(
                        icon: Icons.add,
                        backGraundColor: ColorManage.Primary,
                        iconCoror: ColorManage.white,
                      ),
                    )
                  ],
                ),
              ),
              Container(
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
                          padding: EdgeInsets.all(15).r,
                          decoration: BoxDecoration(
                              color: ColorManage.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)).r),
                          child: Icon(
                            Icons.favorite,
                            color: ColorManage.Primary,
                          )),
                      InkWell(
                        onTap: () {
                          cubit.AddItem(images);
                        },
                        child: Expanded(
                          child: Container(
                              padding: EdgeInsets.only(
                                  bottom: 8.r,
                                  left: 10.r,
                                  right: 10.r,
                                  top: 12.r),
                              decoration: BoxDecoration(
                                  color: ColorManage.Primary,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)).r),
                              child: Text(
                                '\$ ${popular!.bbqs![index].price! * cubit.Number(images['id'])!} | Add to cart',
                                style: TextStyle(
                                    fontSize: FontSize.s15,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                    color: ColorManage.white),
                                maxLines: 1,
                              )),
                        ),
                      )
                    ]),
              ),
            ]),
            body: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    toolbarHeight: 70.h,
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(20),
                      child: Container(
                        decoration: BoxDecoration(
                            color: ColorManage.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.r),
                                topRight: Radius.circular(20.r))),
                        padding: EdgeInsets.only(
                          bottom: 3.r,
                          top: 5.r,
                        ),
                        width: double.maxFinite,
                        child: Center(
                            child: BigText(
                                text: '${popular!.bbqs![index].name!}',
                                size: 20.sp)),
                      ),
                    ),
                    backgroundColor: ColorManage.Primary,
                    title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(builder: ((context) {
                                return rout == 'main'
                                    ? const MainScreen()
                                    : CartView();
                              })), (route) => false);
                            },
                            child: AppIcon(
                              icon: Icons.clear,
                            ),
                          ),
                          Stack(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: ((context) {
                                      return CartView();
                                    })));
                                  },
                                  child: AppIcon(
                                      icon: Icons.shopping_cart_outlined)),
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
                                        padding:
                                            const EdgeInsets.only(right: 1),
                                        child: SmallText(
                                          text: '${cubit.TotalQuantity}',
                                          color: ColorManage.white,
                                          size: 11,
                                        ),
                                      ))
                                  : BigText(text: '')
                            ],
                          ),
                        ]),
                    pinned: true,
                    expandedHeight: 300.h,
                    flexibleSpace: FlexibleSpaceBar(
                        background: Image(
                      image: NetworkImage(popular!.bbqs![index].img!),
                      fit: BoxFit.cover,
                      width: double.maxFinite,
                    )),
                  ),
                  SliverToBoxAdapter(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 8).r,
                    child: Column(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ExpandableTextWidget(
                              text:
                                  'For the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chill for at least 30 mins. Will keep chilled for two days.For the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chillFor the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chillFor the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chillFor the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chillFor the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chill for at least 30 mins. Will keep chilled for two days.For the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chillFor the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chillFor the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chillFor the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chillFor the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chill for at least 30 mins. Will keep chilled for two days.For the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chillFor the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chillFor the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chillFor the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chillFor the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chill for at least 30 mins. Will keep chilled for two days.For the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chillFor the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chillFor the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chillFor the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chillFor the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chill for at least 30 mins. Will keep chilled for two days.For the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chillFor the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chillFor the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chillFor the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chillFor the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chill for at least 30 mins. Will keep chilled for two days.For the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chillFor the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chillFor the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chillFor the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and For the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chill for at least 30 mins. Will keep chilled for two days.For the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chillFor the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chillFor the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chillFor the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chillFor the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chill for at least 30 mins. Will keep chilled for two days.For the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chillFor the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chillFor the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chillFor the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chillFor the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chill for at least 30 mins. Will keep chilled for two days.For the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chillFor the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chillFor the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chillFor the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chill the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chill for at least 30 mins. Will keep chilled for two days.For the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chillFor the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chillFor the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chillFor the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chill For the pastry, rub the butter into the flour, sugar and a pinch of salt in a bowl until crumbly. Mix in the egg until it forms a dough, then form into a puck shape. Cover and chill for at least 30 mins. Will keep chilled for two days.For the pastry, rub the butter into the flour, sugar and a pinch of salt ',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
                ]),
          );
        },
        listener: (BuildContext context, state) {});
  }
}
