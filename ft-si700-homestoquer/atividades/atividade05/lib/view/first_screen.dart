import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: ListView(
          children: <Widget>[
            homePanel(),
            const SizedBox(height: 18),
            homeTitleText("Detalhes:", Colors.black),
            itemsDetails(),
          ],
        ),
      ),
    );
  }

  Widget homeTitleText(String titleText, Color textColor) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(titleText, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor)),
    );
  }

  Widget homePanel() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                boxShadow: [BoxShadow(blurRadius: 6, color: Colors.black54)],
                gradient: LinearGradient(
                  colors: [Color(0xFF4FB852), Color(0xFF5AD15E)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
            Container(
              height: 30,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.0)),
                gradient: LinearGradient(
                  colors: [Color(0xFF4FB852), Color(0xFF5AD15E)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            SizedBox(
              height: 50,
              width: double.infinity,
              child: homeTitleText("O que temos hoje?", Colors.white),
            ),
            itemsQuantity(),
          ],
        ),
      ]
    );
  }

  Widget itemsQuantity() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(blurRadius: 4, color: Color(0xFF9E5D2E))],
                color: Color(0xFFEB8338),
              ),
              child: CircleAvatar(
                radius: 45.0,
                backgroundColor: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(Icons.bathtub, color: Colors.white),
                    SizedBox(height: 5),
                    Text("Higiene",style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            const Text("#2", style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
          ]
        ),
        Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(blurRadius: 4, color: Color(0xFF9E5D2E))],
                color: Color(0xFFEB8338),
              ),
              child: CircleAvatar(
                radius: 45.0,
                backgroundColor: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(Icons.kitchen, color: Colors.white),
                    SizedBox(height: 5),
                    Text("Cozinha",style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            const Text("#3",style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
          ]
        ),
        Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(blurRadius: 4, color: Color(0xFF9E5D2E))],
                color: Color(0xFFEB8338),
              ),
              child: CircleAvatar(
                radius: 45.0,
                backgroundColor: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(Icons.umbrella, color: Colors.white),
                    SizedBox(height: 5),
                    Text("Vestuário",style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            const Text("#2",style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
          ]
        ),
      ],
    );
  }

  Widget itemsDetails() {
    return Column(
      children: [
        ExpansionTile(
          title: const Text('Higiene'),
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Column(children: <Widget>[
                const Text(
                  "PREÇOS",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
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
                            radius: 28.0,
                            backgroundColor: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.arrow_drop_down,
                                  size: 28, 
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Text("R\$12,99"),
                      ],
                    ),
                    Column(
                      children: <Widget>[
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
                            radius: 28.0,
                            backgroundColor: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.compare_arrows,
                                  size: 28,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Text("R\$14,49"),
                      ],
                    ),
                    Column(
                      children: <Widget>[
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
                            radius: 28.0,
                            backgroundColor: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.arrow_drop_up,
                                  size: 28,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Text("R\$15,99"),
                      ],
                    ),
                  ],
                ),
              ]),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Column(children: const <Widget>[
                Text(
                  "MAIOR ORIGEM",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Farmácia Drogasil",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ]),
            ),
            const ExpansionTile(
              title: Text('Itens acabando (1)'),
              children: <Widget>[
                ListTile(
                  title: Text("Lenço de papel 150 folhas - Softy's Elite"),
                  subtitle: Text("2 un • min 2"),
                ),
                ListTile(
                  title: Text("Pasta de dente - Colgate"),
                  subtitle: Text("3 un • min 2"),
                ),
              ]
            ),
          ],
        ),
        ExpansionTile(
          title: const Text('Cozinha'),
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Column(children: <Widget>[
                const Text(
                  "PREÇOS",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
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
                            radius: 28.0,
                            backgroundColor: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.arrow_drop_down,
                                  size: 28, 
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Text("R\$4,61"),
                      ],
                    ),
                    Column(
                      children: <Widget>[
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
                            radius: 28.0,
                            backgroundColor: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.compare_arrows,
                                  size: 28,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Text("R\$7,16"),
                      ],
                    ),
                    Column(
                      children: <Widget>[
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
                            radius: 28.0,
                            backgroundColor: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.arrow_drop_up,
                                  size: 28,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Text("R\$8,99"),
                      ],
                    ),
                  ],
                ),
              ]),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Column(children: const <Widget>[
                Text(
                  "MAIOR ORIGEM",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Enxuto",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ]),
            ),
            const ExpansionTile(
              title: Text('Itens acabando (2)'),
              children: <Widget>[
                ListTile(
                  title: Text("Água de Coco - KeroCoco"),
                  subtitle: Text("3 un • min 2"),
                ),
                ListTile(
                  title: Text("Batata inglesa - Enxuto"),
                  subtitle: Text("0.770 kg • min 0.5"),
                ),
              ]
            ),
            const ExpansionTile(
              title: Text('Itens perto do vencimento (2)'),
              children: <Widget>[
                ListTile(
                  title: Text("Suco de laranja - Neat"),
                  subtitle: Text("Vencimento: 01/01/2022"),
                ),
                ListTile(
                  title: Text("Batata inglesa - Enxuto"),
                  subtitle: Text("Vencimento: 29/04/2022"),
                ),
              ]
            ),
          ],
        ),
        ExpansionTile(
          title: const Text('Vestuário'),
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Column(children: <Widget>[
                const Text(
                  "PREÇOS",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
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
                            radius: 28.0,
                            backgroundColor: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.arrow_drop_down,
                                  size: 28, 
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Text("R\$36,99"),
                      ],
                    ),
                    Column(
                      children: <Widget>[
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
                            radius: 28.0,
                            backgroundColor: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.compare_arrows,
                                  size: 28,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Text("R\$63,49"),
                      ],
                    ),
                    Column(
                      children: <Widget>[
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
                            radius: 28.0,
                            backgroundColor: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.arrow_drop_up,
                                  size: 28,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Text("R\$88,89"),
                      ],
                    ),
                  ],
                ),
              ]),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Column(children: const <Widget>[
                Text(
                  "MAIOR ORIGEM",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Shopping Ibirapuera",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ]),
            ),
            const ExpansionTile(
              title: Text('Itens acabando (1)'),
              children: <Widget>[
                ListTile(
                  title: Text("Jeans azul - VivLeroa"),
                  subtitle: Text("1 un • min 1"),
                ),
              ]
            ),
          ],
        ),
      ],
    );
  }
}