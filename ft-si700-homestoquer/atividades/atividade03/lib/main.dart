import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:si700_estoque/view/first_screen.dart';
import 'package:si700_estoque/view/second_screen.dart';
import 'package:si700_estoque/view/third_screen.dart';

import 'bloc/manage_bloc.dart';
import 'bloc/monitor_bloc.dart';
import 'bloc/form_bloc.dart';

/// Nome: Victor Yukio Shirasuna
/// RA: 245155

void main() {
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homestoquer"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Busca",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: "Registro",
          ),
        ],
        currentIndex: _currentScreen,
        onTap: (int novoItem) {
          setState(() => _currentScreen = novoItem); 
        },
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ManageBloc()),
          BlocProvider(create: (_) => MonitorBloc()),
          BlocProvider(create: (_) => RadioBloc()),
          BlocProvider(create: (_) => CheckBoxBloc()),
          BlocProvider(create: (_) => DateBloc()),
        ],
        child: IndexedStack(
          index: _currentScreen,
          children: [
              Home(),
              Search(),
              Register(),
          ],
        ),
      )
    );
  }
}