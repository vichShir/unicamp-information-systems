import 'package:flutter/material.dart';
import 'package:si700_estoque/view/first_screen.dart';
import 'package:si700_estoque/view/third_screen.dart';

/// Nome: Victor Yukio Shirasuna
/// RA: 245155

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        fontFamily: 'Roboto',
        primarySwatch: Colors.green,
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Homestoquer - Atividade 02"),
            bottom: const TabBar(tabs: [
              Tab(icon: Icon(Icons.account_box)),
              Tab(icon: Icon(Icons.account_box)),
              Tab(icon: Icon(Icons.shopping_basket)),
            ]),
          ),
          body: const TabBarView(children: [
            ProfileScreen(),
            Icon(Icons.account_box),
            WorkSubjectScreen(),
          ]),
        ),
      )
    );
  }
}