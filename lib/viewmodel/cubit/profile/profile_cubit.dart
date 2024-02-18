import 'package:ecommerce_app/model/user.dart';
import 'package:ecommerce_app/viewmodel/cubit/profile/profile_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PorfileCubit extends Cubit<ProfileStatus> {
  PorfileCubit() : super(ProfileInitial());

  void getDatat() async {
    emit(ProfileLoading());
    try {
      await Future.delayed(const Duration(seconds: 2));
      emit(ProfileLoaded(user: dummyUser));
    } catch (e) {
      emit(ProfileError(errorMsg: e.toString()));
    }
  }
}
