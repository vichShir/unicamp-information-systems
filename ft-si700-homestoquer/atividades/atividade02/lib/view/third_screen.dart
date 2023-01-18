import 'dart:ui';

import 'package:flutter/material.dart';

class WorkSubjectScreen extends StatelessWidget {
  const WorkSubjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: containers(),
        ),
      ),
    );
  }

  List<Widget> containers() {
    return [
      SizedBox(
        height: 200,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset('lib/assets/images/home-stuff-background.png', fit: BoxFit.cover),
            ClipRRect( // Clip it cleanly. 
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Container(
                  color: Colors.grey.withOpacity(0.1),
                  alignment: Alignment.center,
                  child: const Text(
                    'HOMESTOQUER',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        BoxShadow(blurRadius: 16)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(blurRadius: 6, color: Colors.black54)],
                  gradient: LinearGradient(
                    colors: [Color.fromARGB(255, 230, 74, 25), Color.fromARGB(255, 247, 159, 31)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: CircleAvatar(
                  radius: 45.0,
                  backgroundColor: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.bathtub, 
                        color: Colors.white,
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Higiene",
                        style: TextStyle(
                          color: Colors.white,
                        )
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(blurRadius: 6, color: Colors.black54)],
                  gradient: LinearGradient(
                    colors: [Color.fromARGB(255, 230, 74, 25), Color.fromARGB(255, 247, 159, 31)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: CircleAvatar(
                  radius: 45.0,
                  backgroundColor: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.kitchen, 
                        color: Colors.white,
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Cozinha",
                        style: TextStyle(
                          color: Colors.white,
                        )
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(blurRadius: 6, color: Colors.black54)],
                  gradient: LinearGradient(
                    colors: [Color.fromARGB(255, 230, 74, 25), Color.fromARGB(255, 247, 159, 31)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: CircleAvatar(
                  radius: 45.0,
                  backgroundColor: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.umbrella, 
                        color: Colors.white,
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Vestuário",
                        style: TextStyle(
                          color: Colors.white,
                        )
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: const Text(
              "O Homestoquer é um aplicativo que gerencia o estoque de itens de um usuário. No aplicativo é possível visualizar os itens de Higiene, Cozinha e Vestuário da sua casa, facilitando suas compras e economizando seu dinheiro.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    ];
  }
}