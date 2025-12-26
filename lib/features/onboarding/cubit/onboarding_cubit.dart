import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/storage/app_storage.dart';
import '../../../../core/routes/route_guards.dart';

class OnboardingCubit extends Cubit<bool> {
  OnboardingCubit() : super(false);

  /// تحميل الحالة المحفوظة
  Future<void> load() async {
    final completed = await AppStorage.isOnboardingCompleted();
    emit(completed);

    // Hydrate Guard
    RouteGuards.hasCompletedOnboarding = completed;
  }

  /// إنهاء الـ onboarding
  Future<void> complete() async {
    await AppStorage.setOnboardingCompleted();
    emit(true);

    // Update Guard
    RouteGuards.hasCompletedOnboarding = true;
  }
}
