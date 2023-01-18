import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import 'bloc/auth_bloc.dart';
import 'view/wrapper.dart';

/// Nome: Victor Yukio Shirasuna
/// RA: 245155

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homestoquer',
      theme: ThemeData(
        fontFamily: 'Raleway',
        primarySwatch: Colors.green,
      ),
      home: MultiBlocProvider(
        providers: [BlocProvider(create: (context) => AuthBloc())],
        child: const Wrapper(),
      )
    );
  }
}