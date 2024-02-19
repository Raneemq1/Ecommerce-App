import 'package:ecommerce_app/model/user.dart';

class ProfileStatus {}

class ProfileInitial extends ProfileStatus {}

class ProfileLoading extends ProfileStatus {}

class ProfileLoaded extends ProfileStatus {
  User user;

  ProfileLoaded({required this.user});
}

class ProfileError extends ProfileStatus {
  final String errorMsg;

  ProfileError({required this.errorMsg});
}

class SwitchProfileMode extends ProfileStatus {
  bool switchValue;

  SwitchProfileMode(this.switchValue);
}
