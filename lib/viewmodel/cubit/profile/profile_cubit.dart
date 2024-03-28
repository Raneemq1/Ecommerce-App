import 'package:ecommerce_app/model/user.dart';
import 'package:ecommerce_app/services/auth_service.dart';
import 'package:ecommerce_app/services/user_service.dart';
import 'package:ecommerce_app/viewmodel/cubit/auth/auth_cubit.dart';
import 'package:ecommerce_app/viewmodel/cubit/profile/profile_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PorfileCubit extends Cubit<ProfileStatus> {
  PorfileCubit() : super(ProfileInitial());

  final _userService = UserServiceImp();
  final _authService = AuthenticationServiceImpl();

  void getDatat() async {
    emit(ProfileLoading());
    try {
      
      final user = await _authService.currentUser();
      
      debugPrint('profile cubit:${user?.email.toString()}');
      final users = await _userService.getData();
      final dummyUserData =
          users.firstWhere((element) => element.email == user?.email);

      emit(ProfileLoaded(user: dummyUserData));
    } catch (e) {
      
      emit(ProfileError(errorMsg: e.toString()));
    }
  }

  void switchMode(bool value) {
    emit(SwitchProfileMode(value));
  }
}
