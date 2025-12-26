// import 'package:flutter/material.dart';
// import 'package:intravision/core/routes/app_routes.dart';
// import 'package:intravision/core/routes/route_guards.dart';
// import 'package:intravision/core/widgets/shell/main_shell.dart';

// // استيراد الشاشات (تأكد من صحة مسارات الـ import عندك)
// import 'package:intravision/features/splash/presentation/screens/splash_screen.dart';
// import 'package:intravision/features/onboarding/presentation/screens/onboarding_screen.dart';

// class RouteGenerator {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     // 1. تشغيل الحماية (Guard) أولاً لمعرفة الوجهة الصحيحة
//     final String? guardedRoute = RouteGuards.guard(settings.name ?? '');

//     // إذا الـ Guard قرر يبعت المستخدم لمكان تاني (زي الـ onboarding)
//     final String routeToBuild =
//         guardedRoute ?? (settings.name ?? AppRoutes.splash);

//     switch (routeToBuild) {
//       case AppRoutes.splash:
//         return _page(const SplashScreen(), routeName: AppRoutes.splash);

//       case AppRoutes.onboarding:
//         return _page(const OnboardingScreen(), routeName: AppRoutes.onboarding);

//       case AppRoutes.login:
//         // مؤقتاً لحين إنشاء صفحة الـ Login
//         return _page(
//           const Scaffold(body: Center(child: Text('Login Screen'))),
//           routeName: AppRoutes.login,
//         );

//       case AppRoutes.medicalConsent:
//         return _page(
//           const Scaffold(body: Center(child: Text('Medical Consent Screen'))),
//           routeName: AppRoutes.medicalConsent,
//         );

//       case AppRoutes.main:
//         return _page(const MainShell(), routeName: AppRoutes.main);

//       default:
//         return _errorRoute();
//     }
//   }

//   static MaterialPageRoute _page(Widget child, {String? routeName}) {
//     return MaterialPageRoute(
//       settings: RouteSettings(name: routeName),
//       builder: (_) => child,
//     );
//   }

//   static Route<dynamic> _errorRoute() {
//     return MaterialPageRoute(
//       builder: (_) =>
//           const Scaffold(body: Center(child: Text('Route not found'))),
//     );
//   }
// }


//************************************************************
// */
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../features/consent/presentation/screens/medical_consent_screen.dart';
// import 'app_routes.dart';
// import 'route_guards.dart';
// import 'package:intravision/features/splash/presentation/screens/splash_screen.dart';
// import 'package:intravision/features/onboarding/presentation/screens/onboarding_screen.dart';
// import 'package:intravision/features/onboarding/cubit/onboarding_cubit.dart';
// import 'package:intravision/core/widgets/shell/main_shell.dart';

// class RouteGenerator {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     final requestedRoute = settings.name ?? AppRoutes.splash;

//     // 1️⃣ Guard decides
//     final guardedRoute = RouteGuards.guard(requestedRoute);

//     // 2️⃣ Final route to build
//     final routeToBuild = guardedRoute ?? requestedRoute;

//     switch (routeToBuild) {
//       case AppRoutes.splash:
//         return _page(const SplashScreen(), AppRoutes.splash);

//       case AppRoutes.onboarding:
//         return _page(
//           BlocProvider(
//             create: (_) => OnboardingCubit(),
//             child: const OnboardingScreen(),
//           ),
//           AppRoutes.onboarding,
//         );

//       case AppRoutes.login:
//         return _page(
//           const Scaffold(body: Center(child: Text('Login Screen'))),
//           AppRoutes.login,
//         );

//       case AppRoutes.medicalConsent:
//         return _page(
//           const MedicalConsentScreen(),
//            AppRoutes.medicalConsent,
//         );

//       case AppRoutes.main:
//         return _page(const MainShell(), AppRoutes.main);

//       default:
//         return _errorRoute();
//     }
//   }

//   static MaterialPageRoute _page(Widget child, String? routeName) {
//     return MaterialPageRoute(
//       settings: RouteSettings(name: routeName),
//       builder: (_) => child,
//     );
//   }

//   static Route<dynamic> _errorRoute() {
//     return MaterialPageRoute(
//       builder: (_) =>
//           const Scaffold(body: Center(child: Text('Route not found'))),
//     );
//   }
// }


// ***************************************************************

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/consent/presentation/screens/medical_consent_screen.dart';
import 'app_routes.dart';
import 'route_guards.dart';

import 'package:intravision/features/splash/presentation/screens/splash_screen.dart';
import 'package:intravision/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:intravision/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:intravision/core/widgets/shell/main_shell.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final requestedRoute = settings.name ?? AppRoutes.splash;

    // 1️⃣ Guard decides
    final guardedRoute = RouteGuards.guard(requestedRoute);

    // 2️⃣ Final route to build
    final routeToBuild = guardedRoute ?? requestedRoute;

    switch (routeToBuild) {
      case AppRoutes.splash:
        return _page(const SplashScreen(), AppRoutes.splash);

      case AppRoutes.onboarding:
        return _page(
          BlocProvider(
            create: (_) => OnboardingCubit(),
            child: const OnboardingScreen(),
          ),
          AppRoutes.onboarding,
        );

      case AppRoutes.login:
        return _page(
          const Scaffold(body: Center(child: Text('Login Screen'))),
          AppRoutes.login,
        );

      case AppRoutes.medicalConsent:
        return _page(
          const MedicalConsentScreen(),
          AppRoutes.medicalConsent,
        );

      case AppRoutes.main:
        return _page(const MainShell(), AppRoutes.main);

      default:
        return _errorRoute();
    }
  }

  static MaterialPageRoute _page(Widget child, String? routeName) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => child,
    );
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) =>
          const Scaffold(body: Center(child: Text('Route not found'))),
    );
  }
}
