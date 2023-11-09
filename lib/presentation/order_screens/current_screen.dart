import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/color_manage.dart';
import 'package:flutter_application_1/business%20logic/app_cubit.dart';
import 'package:flutter_application_1/business%20logic/app_states.dart';
import 'package:flutter_application_1/models/order_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderView extends StatelessWidget {
  OrderView({
    super.key,
    required this.current,
  });
  bool current;

  @override
  Widget build(BuildContext context) {
    List<OrderModel>? order;
    return BlocConsumer<AppCubit, CubitState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        return ConditionalBuilder(
            condition: true,
            builder: (context) {
              if (cubit.currentOrder!.isNotEmpty) {
                order = current
                    ? cubit.getcurruntOrderList!.reversed.toList()
                    : cubit.gethistoryList!.reversed.toList();

                return SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    child: ListView.builder(
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            '#order ID     ${order![index].id}'),
                                        Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.r),
                                                  color: ColorManage.Primary),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 6,
                                                    top: 6,
                                                    left: 10,
                                                    right: 10),
                                                child: Text(
                                                  ' ${order![index].status}',
                                                  style: TextStyle(
                                                      color: ColorManage.white),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            InkWell(
                                              onTap: () {},
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.r),
                                                    color: ColorManage.white,
                                                    border: Border.all(
                                                        width: 1.w,
                                                        color: ColorManage
                                                            .Primary)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Text(
                                                    ' Track order',
                                                    style: TextStyle(
                                                        color:
                                                            ColorManage.black),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ]),
                                ),
                                SizedBox(
                                  height: 10.h,
                                )
                              ],
                            ),
                          );
                        },
                        itemCount: order!.length),
                  ),
                );
              } else {
                return Center(child: Text('Loding..'));
              }
            },
            fallback: (context) => Center(
                  child: CircularProgressIndicator(color: ColorManage.Primary),
                ));
      },
    );
  }
}
