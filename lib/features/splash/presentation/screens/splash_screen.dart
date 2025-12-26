// import 'dart:async';
// import 'package:flutter/material.dart';

// import 'package:intravision/core/constants/app_assets.dart';
// import 'package:intravision/core/routes/app_routes.dart';
// import 'package:intravision/core/routes/route_guards.dart';
// // import 'package:intravision/core/storage/app_storage.dart';
// import 'package:intravision/features/onboarding/cubit/onboarding_cubit.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     _bootstrap();
//   }

//   Future<void> _bootstrap() async {
//     final cubit = OnboardingCubit();
//     await cubit.load();

//     // مؤقتًا
//     RouteGuards.isLoggedIn = false;
//     RouteGuards.hasGivenMedicalConsent = false;

//     await Future.delayed(const Duration(seconds: 4));
//     if (!mounted) return;

//     Navigator.pushReplacementNamed(context, AppRoutes.main);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Center(child: Image.asset(AppAssets.logoMain, width: 160)),
//             Positioned(
//               bottom: 24,
//               left: 0,
//               right: 0,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'from intra_vision',
//                     style: Theme.of(
//                       context,
//                     ).textTheme.bodySmall?.copyWith(color: Colors.grey),
//                   ),
//                   const SizedBox(width: 8),
//                   Image.asset(AppAssets.logoSmall, width: 20, height: 20),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'dart:async';
import 'package:flutter/material.dart';

import 'package:intravision/core/constants/app_assets.dart';
import 'package:intravision/core/routes/app_routes.dart';
import 'package:intravision/core/routes/route_guards.dart';
import 'package:intravision/features/onboarding/cubit/onboarding_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    // 1️⃣ Load persisted onboarding state
    final onboardingCubit = OnboardingCubit();
    await onboardingCubit.load();

    // 2️⃣ TEMP states (later from Auth / Profile)
    RouteGuards.hasGivenMedicalConsent = false;

    // 3️⃣ Splash delay
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;

    // 4️⃣ Go to ONE entry point only
    Navigator.pushReplacementNamed(
      context,
      AppRoutes.main, // Guard will redirect correctly
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                AppAssets.logoMain,
                width: 160,
              ),
            ),
            Positioned(
              bottom: 24,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'from intra_vision',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(width: 8),
                  Image.asset(
                    AppAssets.logoSmall,
                    width: 20,
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
