import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/routes/route_guards.dart';

/// Auth State
class AuthState {
  final bool isLoggedIn;

  const AuthState({required this.isLoggedIn});
}

/// Auth Cubit
class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState(isLoggedIn: false));

  void login() {
    emit(const AuthState(isLoggedIn: true));
    RouteGuards.isLoggedIn = true;
  }

  void logout() {
    emit(const AuthState(isLoggedIn: false));
    RouteGuards.isLoggedIn = false;
  }
}
