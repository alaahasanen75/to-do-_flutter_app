import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter_application_1/core/color_manage.dart';
import 'package:flutter_application_1/core/componant/app_column.dart';
import 'package:flutter_application_1/core/componant/big_text.dart';
import 'package:flutter_application_1/core/componant/icons_widged.dart';
import 'package:flutter_application_1/core/shard.dart';
import 'package:flutter_application_1/core/values_managers.dart';
import 'package:flutter_application_1/business%20logic/app_cubit.dart';
import 'package:flutter_application_1/business%20logic/app_states.dart';
import 'package:flutter_application_1/models/dummy_data.dart';
import 'package:flutter_application_1/presentation/home_screen/popular_screen.dart';
import 'package:flutter_application_1/presentation/home_screen/recommended_food.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class Padge extends StatelessWidget {
  Padge({super.key});
  int? padge = 0;
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, CubitState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 320.h,
                child: CarouselSlider(
                  items: images
                      .map(
                        (e) => InkWell(
                          onTap: () {
                            CachHelper.getListOfString(key: 'Cart-List') != null
                                ? print(CachHelper.getListOfString(
                                    key: 'Cart-List'))
                                : print('dddddd');

                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: ((context) {
                              return PopularView(
                                e: e,
                              );
                            })));
                          },
                          child: Stack(
                            children: [
                              Card(
                                margin:
                                    const EdgeInsets.only(left: 2, right: 2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                elevation: 20,
                                child: Container(
                                  height: 220.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                            '${e['image']}',
                                          ))),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Card(
                                  margin: const EdgeInsets.only(
                                      left: 30, right: 30, bottom: 30),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  elevation: 20,
                                  child: Container(
                                    height: 120.h,
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Container(
                                        padding: const EdgeInsets.only(
                                            top: 15, left: 15, right: 15),
                                        child: AppColumn(
                                          text: '${e['name']}',
                                        )),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                      height: 320.h,
                      onPageChanged: (index, reason) {
                        AppCubit.get(context).Chandepadge(index);
                      },
                      autoPlay: true,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: true),
                ),
              ),
              new DotsIndicator(
                dotsCount: 5,
                position: AppCubit.get(context).index!,
                decorator: DotsDecorator(
                  activeColor: ColorManage.Primary,
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                margin: EdgeInsets.only(left: 20.r),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BigText(
                      text: 'Recommended',
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0).r,
                      child: Container(
                        child: BigText(text: '.', color: ColorManage.grey2),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3).r,
                      child: Container(
                        child: SmallText(text: 'food pairing'),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              ConditionalBuilder(
                  condition: state is! PopularLoadihgState &&
                      AppCubit.get(context).popular != null,
                  builder: (context) => Container(
                        height: 900.h,
                        child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 1.h,
                              );
                            },
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  cubit.indexPadge(
                                      index, cubit.popular!.bbqs![index].name!);
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(builder: ((context) {
                                    return RecommendedFoogView(
                                      index: index,
                                      popular: cubit.popular,
                                      rout: 'main',
                                    );
                                  })), (route) => false);
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  margin: EdgeInsets.only(
                                      left: 15.r, right: 10.r, top: 15.r),
                                  elevation: 1,
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 120.h,
                                          width: 120.w,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: index != 6
                                                      ? NetworkImage(cubit
                                                          .popular!
                                                          .bbqs![index]
                                                          .img!)
                                                      : NetworkImage(
                                                          "https://goldbelly.imgix.net/uploads/showcase_media_asset/image/96250/bbq-ribs-and-pulled-pork-dinner-for-8.283f3612fdcc300876b961dc513056ea.jpg?ixlib=react-9.0.2&auto=format&ar=1%3A1")),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: 100,
                                            width: 200,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight:
                                                      Radius.circular(20.r)),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                      right: 7, left: 7)
                                                  .r,
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    BigText(
                                                        text: cubit.popular!
                                                            .bbqs![index].name),
                                                    SizedBox(
                                                      height: 10.h,
                                                    ),
                                                    SmallText(
                                                        text: cubit.popular!
                                                            .bbqs![index].dsc),
                                                    SizedBox(
                                                      height: 10.h,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        IconAndText(
                                                            icon: Icons
                                                                .circle_sharp,
                                                            text: 'normal',
                                                            colorIcon:
                                                                ColorManage
                                                                    .iconColor1),
                                                        IconAndText(
                                                            icon: Icons
                                                                .location_on_outlined,
                                                            text: '1.7km',
                                                            colorIcon:
                                                                ColorManage
                                                                    .Primary),
                                                        IconAndText(
                                                            icon: Icons
                                                                .access_time_filled_outlined,
                                                            text: '32min',
                                                            colorIcon:
                                                                ColorManage
                                                                    .iconColor2)
                                                      ],
                                                    )
                                                  ]),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: cubit.popular!.bbqs!.length,
                          ),
                        ),
                      ),
                  fallback: (context) => const Center(
                        child:
                            CircularProgressIndicator(color: Color(0xff7CD1C5)),
                      ))
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
