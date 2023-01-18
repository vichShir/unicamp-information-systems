import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox.expand(
          child: ListView(
            children: itens(context),
          ),
        ),
      ),
    );
  }

  List<Widget> itens(BuildContext context) {
    return <Widget>[
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextField(
          onChanged: (value) {},
          decoration: const InputDecoration(
            labelText: "Buscar",
            hintText: "Buscar",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
        ),
      ),
      Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 1, color: Colors.black54)],
        ),
        child: ListTile(
          title: const Text("Lenço de papel 150 folhas - Softy's Elite"),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("2 un • min 2"),
              Text("R\$12,99 • Farmácia Drogasil"),
              Text("Função: limpeza geral"),
          ]),
          leading: const Icon(Icons.bathtub, color: Color(0xFFEB8338)),
          trailing: GestureDetector(
            child: const Icon(Icons.delete),
            onTap: (){
              deleteItem(context);
            }
          ),
        ),
      ),
      const SizedBox(height: 8),
      Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 1, color: Colors.black54)],
        ),
        child: ListTile(
          title: const Text("Pasta de dente - Colgate"),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("3 un • min 2"),
              Text("R\$15,99 • Farmácia Drogasil"),
              Text("Função: limpeza bucal"),
          ]),
          leading: const Icon(Icons.bathtub, color: Color(0xFFEB8338)),
          trailing: GestureDetector(
            child: const Icon(Icons.delete),
            onTap: (){
              deleteItem(context);
            }
          ),
        ),
      ),
      const SizedBox(height: 8),
      Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 1, color: Colors.black54)],
        ),
        child: ListTile(
          title: const Text("Suco de laranja - Neat"),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("3 un • min 1"),
              Text("R\$8,99 • Enxuto"),
              Text("Vencimento: 01/01/2022"),
              Text("Refrigeração: Sim"),
          ]),
          leading: const Icon(Icons.kitchen, color: Color(0xFFEB8338)),
          trailing: GestureDetector(
            child: const Icon(Icons.delete),
            onTap: (){
              deleteItem(context);
            }
          ),
        ),
      ),
      const SizedBox(height: 8),
      Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 1, color: Colors.black54)],
        ),
        child: ListTile(
          title: const Text("Água de Coco - KeroCoco"),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("3 un • min 2"),
              Text("R\$7,90 • Enxuto"),
              Text("Vencimento: 01/06/2022"),
              Text("Refrigeração: Não"),
          ]),
          leading: const Icon(Icons.kitchen, color: Color(0xFFEB8338)),
          trailing: GestureDetector(
            child: const Icon(Icons.delete),
            onTap: (){
              deleteItem(context);
            }
          ),
        ),
      ),
      const SizedBox(height: 8),
      Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 1, color: Colors.black54)],
        ),
        child: ListTile(
          title: const Text("Batata inglesa - Enxuto"),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("0.770 kg • min 0.5"),
              Text("R\$4,61 • Enxuto"),
              Text("Vencimento: 29/04/2022"),
              Text("Refrigeração: Não"),
          ]),
          leading: const Icon(Icons.kitchen, color: Color(0xFFEB8338)),
          trailing: GestureDetector(
            child: const Icon(Icons.delete),
            onTap: (){
              deleteItem(context);
            }
          ),
        ),
      ),
      const SizedBox(height: 8),
      Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 1, color: Colors.black54)],
        ),
        child: ListTile(
          title: const Text("Par de meias P - Lupo"),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("6 un • min 3"),
              Text("R\$36,99 • Shopping Ibirapuera"),
              Text("Tecido: Lã"),
              Text("Cor: Branco"),
              Text("Importado: Não"),
          ]),
          leading: const Icon(Icons.umbrella, color: Color(0xFFEB8338)),
          trailing: GestureDetector(
            child: const Icon(Icons.delete),
            onTap: (){
              deleteItem(context);
            }
          ),
        ),
      ),
      const SizedBox(height: 8),
      Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 1, color: Colors.black54)],
        ),
        child: ListTile(
          title: const Text("Jeans azul - VivLeroa"),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("1 un • min 1"),
              Text("R\$89,99 • Shopping Ibirapuera"),
              Text("Tecido: Denim"),
              Text("Cor: Azul"),
              Text("Importado: Sim"),
          ]),
          leading: const Icon(Icons.umbrella, color: Color(0xFFEB8338)),
          trailing: GestureDetector(
            child: const Icon(Icons.delete),
            onTap: (){
              deleteItem(context);
            }
          ),
        ),
      ),
    ];
  }

  void deleteItem(BuildContext context)
  {
    FocusScope.of(context).unfocus();
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Deletar item'),
        content: const Text('Deseja deletar o item?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancelar'),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'OK');
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.green,
                duration: const Duration(seconds: 3),
                content: const Text("Item excluído!"),
                action: SnackBarAction(
                  label: "Volte Sempre!",
                  onPressed: () {}
                  )
                )
              );
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}