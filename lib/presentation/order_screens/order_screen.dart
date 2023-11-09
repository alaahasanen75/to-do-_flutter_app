import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/color_manage.dart';
import 'package:flutter_application_1/core/componant/constant.dart';
import 'package:flutter_application_1/presentation/order_screens/current_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderScreen extends StatefulWidget {
  OrderScreen({
    super.key,
  });

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with TickerProviderStateMixin {
  bool? loading;
  TabController? tabController;
  void initState() {
    super.initState();
    // loading = token != null;
    // if (loading!) {
    tabController = TabController(length: 2, vsync: this);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('My order')),
        backgroundColor: ColorManage.Primary,
      ),
      body: Column(children: [
        Container(
          height: 60.h,
          width: double.infinity,
          child: TabBar(
            controller: tabController,
            indicatorColor: ColorManage.Primary,
            unselectedLabelColor: ColorManage.yellowColor,
            labelColor: ColorManage.Primary,
            indicatorWeight: 3,
            tabs: [
              Text(
                'History',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp),
              ),
              Text(
                'current',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp),
              )
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
              controller: tabController,
              children: [OrderView(current: false), OrderView(current: true)]),
        )
      ]),
    );
  }
}
