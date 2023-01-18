import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:si700_estoque/view/first_screen.dart';
import 'package:si700_estoque/view/second_screen.dart';
import 'package:si700_estoque/view/third_screen.dart';

import '../bloc/auth_event.dart';
import '../bloc/manage_bloc.dart';
import '../bloc/monitor_bloc.dart';
import '../bloc/form_bloc.dart';
import '../bloc/auth_bloc.dart';

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MainApp> {
  int _currentScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homestoquer"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              BlocProvider.of<AuthBloc>(context).add(Logout());
            },
          ),
        ],
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
              const Home(),
              Search(),
              Register(),
          ],
        ),
      )
    );
  }
}