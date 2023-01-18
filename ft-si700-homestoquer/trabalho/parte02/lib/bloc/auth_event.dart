import '../model/user_model.dart';

abstract class AuthEvent {}

class RegisterUser extends AuthEvent {
  String username;
  String password;
  String nome;
  String endereco;
  String telefone;

  RegisterUser({required this.username, required this.password, required this.nome, required this.endereco, required this.telefone});
}

class LoginUser extends AuthEvent {
  String username;
  String password;

  LoginUser({required this.username, required this.password});
}

class LoginAnonymousUser extends AuthEvent {}

class Logout extends AuthEvent {}

class AuthServerEvent extends AuthEvent {
  final UserModel? userModel;
  AuthServerEvent(this.userModel);
}