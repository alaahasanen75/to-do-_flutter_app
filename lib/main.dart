import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/componant/constant.dart';
import 'package:flutter_application_1/core/network/bloc_observe.dart';
import 'package:flutter_application_1/core/network/dio_factory.dart';
import 'package:flutter_application_1/core/shard.dart';
import 'package:flutter_application_1/business%20logic/app_cubit.dart';
import 'package:flutter_application_1/business%20logic/login_cubit.dart';
import 'package:flutter_application_1/presentation/Layout_screen.dart';

import 'package:flutter_application_1/presentation/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  Bloc.observer = const SimpleBlocObserver();
  await CachHelper.init();

  Widget widget;
  token = CachHelper.getData(
    key: 'token',
  );

  if (token != null) {
    widget = const MainScreen();
  } else {
    widget = const SplashScreen();
  }

  runApp(MyApp(
    startewidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startewidget;
  const MyApp({super.key, required this.startewidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: ((context) => AppCubit()
              ..GetPopular()
              ..getCartData()
              ..getOrder()),
          ),
          BlocProvider(
            create: (context) => LoginCubit()..createDataBase(),
          )
        ],
        child: ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, child) {
              return MaterialApp(
                  theme: ThemeData(
                      appBarTheme: const AppBarTheme(
                          systemOverlayStyle: SystemUiOverlayStyle(
                              statusBarBrightness: Brightness.light))),
                  debugShowCheckedModeBanner: false,
                  home: const SplashScreen());
            }));
  }
}
