import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:si700_estoque/model/itens.dart';

import '../bloc/auth_bloc.dart';
import '../bloc/auth_state.dart';
import '../bloc/monitor_bloc.dart';
import '../bloc/monitor_state.dart';
import '../model/user_model.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MonitorBloc, MonitorState>(
      builder: (context, state) {
        return Scaffold(
          body: SizedBox.expand(
            child: ListView(
              children: <Widget>[
                homePanel(state.itemCollection),
                const SizedBox(height: 18),
                homeTitleText("Detalhes:", Colors.black),
                itemsDetails(state.itemCollection),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (authContext, authState) {
                    if(authState is Authenticated) {
                      return userDetails(authState.userInfo);
                    }
                    return const Text("Não foi possível carregar.");
                  }
                )
              ],
            ),
          )
        );
      }
    );
  }

  Widget homeTitleText(String titleText, Color textColor) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(titleText, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor)),
    );
  }

  Widget homePanel(ItemCollection itemCollection) {
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
            itemsQuantity(itemCollection),
          ],
        ),
      ]
    );
  }

  Widget itemsQuantity(ItemCollection itemCollection) {
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
            Text("#${itemCollection.countHigiene()}", style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
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
            Text("#${itemCollection.countCozinha()}",style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
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
            Text("#${itemCollection.countVestuario()}",style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
          ]
        ),
      ],
    );
  }

  ListView getNoteListView(ItemCollection itemCollection, int type) {
    return ListView.builder(
      itemCount: itemCollection.length(),
      itemBuilder: (context, position) {
        var currentItem = itemCollection.getItemAtIndex(position);
        if(itemCollection.getIndexOfIcon(position) == type) {
          String itemQuantidade = currentItem.quantidade.toString();
          String itemUnidade = currentItem.unidade;
          String itemMinQuantidade = currentItem.minQuantidade.toString();
          return ListTile(
            title: Text(currentItem.descricao + " - " + currentItem.marca),
            subtitle: Text("$itemQuantidade $itemUnidade • min $itemMinQuantidade"),
          );
        }
        return ListView();
      }
    );
  }

  Widget itemsDetails(ItemCollection itemCollection) {
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
                        Text("R\$${itemCollection.minPriceHigiene()}"),
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
                        Text("R\$${itemCollection.meanPriceHigiene()}"),
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
                        Text("R\$${itemCollection.maxPriceHigiene()}"),
                      ],
                    ),
                  ],
                ),
              ]),
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
                        Text("R\$${itemCollection.minPriceCozinha()}"),
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
                        Text("R\$${itemCollection.meanPriceCozinha()}"),
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
                        Text("R\$${itemCollection.maxPriceCozinha()}"),
                      ],
                    ),
                  ],
                ),
              ]),
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
                        Text("R\$${itemCollection.minPriceVestuario()}"),
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
                        Text("R\$${itemCollection.meanPriceVestuario()}"),
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
                        Text("R\$${itemCollection.maxPriceVestuario()}"),
                      ],
                    ),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ],
    );
  }

  Widget userDetails(UserInfo user) {
    return ExpansionTile(
      title: const Text('Usuário'),
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: Column(children: <Widget>[
            SizedBox(width: double.infinity, height: 25, child: Text("Nome: ${user.nome}")),
            SizedBox(width: double.infinity, height: 25, child: Text("Endereço: ${user.endereco}")),
            SizedBox(width: double.infinity, height: 25, child: Text("Telefone: ${user.telefone}")),
          ]),
        ),
      ],
    );
  }
}