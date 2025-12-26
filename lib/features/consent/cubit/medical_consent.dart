import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/routes/route_guards.dart';

class MedicalConsentCubit extends Cubit<bool> {
  MedicalConsentCubit() : super(false);

  /// قبول الموافقة الطبية
  void accept() {
    emit(true);
    RouteGuards.hasGivenMedicalConsent = true;
  }

  /// رفض / إعادة تعيين (لو احتجنا)
  void reset() {
    emit(false);
    RouteGuards.hasGivenMedicalConsent = false;
  }
}
