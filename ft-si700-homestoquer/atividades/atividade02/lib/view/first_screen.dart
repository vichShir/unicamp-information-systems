import 'dart:math';

import 'package:si700_estoque/model/item.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Item> _itens = [];
  List<Color> _colors = [Colors.red, Colors.green, Colors.blue];
  Random random = Random();

  void _addItem() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.

      int randomNumber = random.nextInt(3);
      if (randomNumber == 0) {
        _itens.add(Higiene('Protetor Solar 60FPS Toque Seco', 'Sunless', TipoUnitario.unidade, 1, 'Pele'));
      } 
      else if (randomNumber == 1) {
        try {
          // 0: naoDefinida
          // 6: litro
          var tuErrorIndexes = [0, 6];
          var randomErrorIndex = tuErrorIndexes[random.nextInt(2)];
          _itens.add(Vestuario('Meia P', 'Lupo', TipoUnitario.values[randomErrorIndex], 6, 'Algodão', 'Branco', false));
        }
        on FormatException {
          _itens.add(Vestuario('Meia P', 'Lupo', TipoUnitario.par, 6, 'Algodão', 'Branco', false));
        }
        on Exception catch (obj) {
          _itens.add(Vestuario(obj.toString(), 'Lupo', TipoUnitario.par, 6, 'Algodão', 'Branco', false));
        }
      }
      else {
        _itens.add(Cozinha('Salsicha Hot Dog', 'Sadia', TipoUnitario.unidade, 1, DateTime.parse("2022-05-10"), true));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: _itens.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 180,
                        color: _colors[index % _colors.length],
                        margin: const EdgeInsets.all(2),
                        child: Text(
                          '${_itens[index].displayInfo()} )',
                          style: const TextStyle(fontSize: 18),
                        ),
                      );
                    }))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        tooltip: 'Add Item',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  final String nome = "Victor Yukio Shirasuna";
  final String titulo = "Estudante de Sistemas de Informação na Unicamp";
  final String sobreMim = "Iniciei minha jornada em tecnologia aos 11 anos por grande fascinação por games, quis sempre descobrir os mecanismos por trás de cada jogo e desenvolver os meus próprios.\nEntretanto, foi na disciplina de Fundamentos de Sistemas de Informação da faculdade, que me redescobri ao ser introduzido a Ciência de Dados ao buscar soluções com o que faço bem-feito. Desde então, busco desenvolver habilidades de resolução de problemas baseado em dados. ";
  
  final double fontTitleSize = 28;
  final double fontTextSize = 16;

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
      Container(
        height: 250,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 230, 74, 25), Color.fromARGB(255, 247, 159, 31)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(blurRadius: 12, color: Colors.black54)],
              ),
              child: const CircleAvatar(
                backgroundColor: Colors.white70,
                minRadius: 60.0,
                child: CircleAvatar(
                  radius: 60.0,
                  backgroundImage: AssetImage('lib/assets/images/profile-photo.jpg'),
                ),
              ),
            ),
            SizedBox(
              height: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text (
                    nome,
                    style: TextStyle(
                      fontSize: fontTitleSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ), 
                  Text(
                    titulo,
                    style: TextStyle(
                      fontSize: fontTextSize,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SizedBox(
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Sobre Mim",
                style: TextStyle(
                  fontSize: fontTitleSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                sobreMim,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: fontTextSize,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      // Container(
      //   alignment: Alignment.bottomCenter,
      //   //margin: EdgeInsets.all(4),
      //   //padding: EdgeInsets.all(10),
      //   decoration: const BoxDecoration(
      //     shape: BoxShape.circle,
      //     boxShadow: [
      //       BoxShadow(blurRadius: 2)
      //     ],
      //     color: Colors.white,
      //   ),
      //   child: const CircleAvatar(
      //     backgroundColor: Colors.white70,
      //     minRadius: 60.0,
      //     child: CircleAvatar(
      //       radius: 52.0,
      //       backgroundImage: NetworkImage('https://avatars0.githubusercontent.com/u/28812093?s=460&u=06471c90e03cfd8ce2855d217d157c93060da490&v=4'),
      //     ),
      //   ),
      // ),
    ];
  }
}