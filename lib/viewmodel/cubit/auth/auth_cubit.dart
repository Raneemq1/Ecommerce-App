import 'package:ecommerce_app/model/user.dart';
import 'package:ecommerce_app/services/auth_service.dart';
import 'package:ecommerce_app/viewmodel/cubit/auth/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final authService = AuthenticationServiceImpl();

  void signInWithEmailAndPassword(String email, String password) async {
    emit(AuthLoading());
    try {
      final result =
          await authService.signInWithEmailAndPassword(email, password);
      if (result) {
        emit(AuthSuccess());
      } else {
        emit(AuthFaliure('Faild'));
      }
    } catch (e) {
      emit(AuthFaliure(e.toString()));
    }
  }

  void signUpWithEmailAndPassword(String email, String password) async {
    emit(AuthLoading());
    try {
      final result =
          await authService.signUpWithEmailAndPassword(email, password);
      if (result) {
        emit(AuthSuccess());
      } else {
        emit(AuthFaliure('Faild'));
      }
    } catch (e) {
      emit(AuthFaliure(e.toString()));
    }
  }

  Future<void> logOut() async {
    await authService.signOut();
    emit(AuthSuccess());
  }

  Future<void> getCurrentUser() async {
    emit(AuthLoading());
    try {
      var user = await authService.currentUser();
      if (user != null) {
        emit(AuthSuccess());
      } else {
        emit(AuthInitial());
      }
    } catch (e) {
      emit(AuthInitial());
    }
  }
}
