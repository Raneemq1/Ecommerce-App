class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthFaliure extends AuthState {
  final String msg;
  AuthFaliure(this.msg);
}
