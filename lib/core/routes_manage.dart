// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/core/string_manege.dart';
// import 'package:flutter_application_1/features/clean%20arch/presentation/screens/forgot_password.dart';

// import '../features/clean arch/presentation/screens/details_screen.dart';
// import '../features/clean arch/presentation/screens/login_screen.dart';
// import '../features/clean arch/presentation/screens/main_screen.dart';
// import '../features/clean arch/presentation/screens/onboarding_screen/onbording_view.dart';
// import '../features/clean arch/presentation/screens/regester_screen.dart';
// import '../features/clean arch/presentation/screens/splash_screen.dart';

// class Routes {
//   static const String splashRoute = "/";
//   static const String loginRoute = "/login";
//   static const String registerRoute = "/sregister";
//   static const String forgotPaswordRoute = "/forgotPasword";
//   static const String mainRoute = "/main";
//   static const String detailsRoute = "/ details";
//   static const String onbording = "/ onbording";
// }

// class RouteGenerator {
//   static Route<dynamic> getRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case Routes.splashRoute:
//         return MaterialPageRoute(builder: (_) => Splash());

//       case Routes.detailsRoute:
//         return MaterialPageRoute(builder: (_) => const DetailsView());

//       case Routes.forgotPaswordRoute:
//         return MaterialPageRoute(builder: (_) => const ForgotView());

//       case Routes.loginRoute:
//         return MaterialPageRoute(builder: (_) => login());

//       case Routes.mainRoute:
//         return MaterialPageRoute(builder: (_) => const MainView());

//       case Routes.registerRoute:
//         //  RegesterView()
//         return MaterialPageRoute(builder: (_) => const MainView());
//       case Routes.onbording:
//         return MaterialPageRoute(builder: (_) => const onboardingScreen());

//       default:
//         return unDefindRoute();
//     }
//   }

//   static Route<dynamic> unDefindRoute() {
//     return MaterialPageRoute(
//         builder: (_) => Scaffold(
//               appBar: AppBar(title: Text(AppString.NoRouteFound)),
//               body: Center(child: Text(AppString.NoRouteFound)),
//             ));
//   }
// }
