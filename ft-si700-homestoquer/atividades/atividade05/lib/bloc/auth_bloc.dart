import 'package:flutter_bloc/flutter_bloc.dart';

import '../provider/firebase_auth.dart';
import '../provider/firebase_firestore.dart';
import '../model/user_model.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuthenticationService _authenticationService = FirebaseAuthenticationService();

  AuthBloc() : super(Unauthenticated()) {
    _authenticationService.user.listen((event) {
      add(AuthServerEvent(event));
    });

    on<AuthServerEvent>((event, emit) {
      if (event.userModel == null) {
        emit(Unauthenticated());
      } else {
        FirestoreServer.helper.uid = event.userModel!.uid;
        emit(Authenticated(userModel: event.userModel!));
      }
    });
    on<RegisterUser>((event, emit) async {
      try {
        await _authenticationService.createUserWithEmailAndPassword(event.username, event.password);
      } catch (e) {
        emit(AuthError(message: "Impossível Registrar: ${e.toString()}"));
      }
    });
    on<LoginUser>((event, emit) async {
      try {
        await _authenticationService.signInWithEmailAndPassword(event.username, event.password);
      } catch (e) {
        emit(AuthError(message: "Impossível Logar com ${event.username}: ${e.toString()}"));
      }
    });
    on<LoginAnonymousUser>((event, emit) async {
      try {
        await _authenticationService.signInAnonimo();
      } catch (e) {
        emit(AuthError(message: "Impossível Acessar Anonimamente: ${e.toString()}"));
      }
    });
    on<Logout>((event, emit) async {
      try {
        await _authenticationService.signOut();
      } catch (e) {
        emit(AuthError(message: "Impossível Efeturar Logout: ${e.toString()}"));
      }
    });
  }
}