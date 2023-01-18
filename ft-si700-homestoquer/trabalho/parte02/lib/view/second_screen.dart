import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/manage_bloc.dart';
import '../bloc/manage_event.dart';

import 'package:si700_estoque/model/itens.dart';

import '../bloc/monitor_bloc.dart';
import '../bloc/monitor_state.dart';

class Search extends StatelessWidget {
  Search({Key? key}) : super(key: key);

  final List colors = [
    const Color(0xFF5530DB),
    const Color(0xFFDB6604),
    const Color(0xFF1ADB21)
  ];
  final List icons = [
    Icons.bathtub,
    Icons.kitchen,
    Icons.umbrella
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MonitorBloc, MonitorState>(
      builder: (context, state) => getNoteListView(state.itemCollection),
    );
  }

  Widget getNoteListView(ItemCollection itemCollection) {
    return (itemCollection.length() != 0) ? ListView.builder(
      itemCount: itemCollection.length(),
      itemBuilder: (context, position) {
        var currentItem = itemCollection.getItemAtIndex(position);
        var itemId = itemCollection.getIdAtIndex(position);
        String itemQuantidade = currentItem.quantidade.toString();
        String itemUnidade = currentItem.unidade;
        String itemMinQuantidade = currentItem.minQuantidade.toString();
        String itemPreco = currentItem.preco.toString();
        String itemOrigem = currentItem.origem;
        return ListTile(
          onTap: () {
            BlocProvider.of<ManageBloc>(context).add(UpdateRequest(itemId: itemId, previousItem: currentItem));
          },
          leading: Icon(icons[itemCollection.getIndexOfIcon(position)], color: colors[itemCollection.getIndexOfIcon(position)]),
          trailing: GestureDetector(
            onTap: () {
              BlocProvider.of<ManageBloc>(context).add(DeleteEvent(itemId: itemId));
            },
            child: const Icon(Icons.delete)
          ),
          title: Text(currentItem.descricao + " - " + currentItem.marca),
          subtitle: Text("$itemQuantidade/$itemMinQuantidade $itemUnidade\nR\$$itemPreco • $itemOrigem"),
        );
      }
    ) 
    : Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        Text("Nenhum item registrado.", style: TextStyle(fontSize: 18))
      ]
    );
  }
}