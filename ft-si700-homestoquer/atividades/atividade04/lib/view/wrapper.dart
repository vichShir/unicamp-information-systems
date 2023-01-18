import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_screen.dart';

import '../bloc/auth_bloc.dart';
import '../bloc/auth_state.dart';

import 'main_app.dart';
import 'register_screen.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WrapperState();
  }
}

class WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Erro do Firebase"),
                  content: Text(state.message),
                );
              });
        }
      },
      builder: (context, state) {
        if (state is Authenticated) {
          return const MainApp();
        } else {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Column(children: <Widget>[
                const SizedBox(height: 200,),
                const Center(
                  child: Text("Login", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold))
                ),
                const LoginScreen(),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all(const Size(220, 50)),
                        backgroundColor: MaterialStateProperty.all(Colors.transparent),
                        elevation: MaterialStateProperty.all(3),
                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: const Text('Ainda não tem uma conta? Registre-se', 
                        style: TextStyle(
                          color: Colors.black, 
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => RegisterScreen(cont: context,)),
                        );
                      },
                    ),
                  ),
                ),
              ]
            ),
          );
        }
      },
    );
  }
}