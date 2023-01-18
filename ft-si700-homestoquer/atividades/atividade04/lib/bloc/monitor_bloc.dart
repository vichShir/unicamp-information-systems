import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/itens.dart';
import '../provider/rest_provider_no_sync.dart';
import 'monitor_event.dart';
import 'monitor_state.dart';

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  ItemCollection itemCollection = ItemCollection();

  MonitorBloc() : super(MonitorState(itemCollection: ItemCollection())) {
    on<AskNewList>((event, emit) async {
      itemCollection = await RestServer.helper.getItemList();
      emit(MonitorState(itemCollection: itemCollection));
    });

    add(AskNewList());
  }
}