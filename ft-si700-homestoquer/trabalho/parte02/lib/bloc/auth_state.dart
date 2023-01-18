import '../model/user_model.dart';

abstract class AuthState {}

class Unauthenticated extends AuthState {}

class Authenticated extends AuthState {
  UserModel userModel;
  UserInfo userInfo;
  Authenticated({required this.userModel, required this.userInfo});
}

class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}