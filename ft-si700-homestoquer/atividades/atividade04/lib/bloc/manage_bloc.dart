import 'package:si700_estoque/bloc/manage_event.dart';
import 'package:si700_estoque/provider/rest_provider_no_sync.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'manage_state.dart';

class ManageBloc extends Bloc<ManageEvent, ManageState> {
  ManageBloc() : super(InsertState()) {
    on<UpdateRequest>((event, emit) {
      emit(UpdateState(itemId: event.itemId, previousItem: event.previousItem));
    });

    on<UpdateCancel>((event, emit) {
      emit(InsertState());
    });

    on<SubmitEvent>((event, emit) {
      if (state is InsertState) {
        RestServer.helper.insertItem(event.item);
      } else if (state is UpdateState) {
        RestServer.helper.updateItem((state as UpdateState).itemId, event.item);
      }
    });

    on<DeleteEvent>((event, emit) {
      RestServer.helper.deleteItem(event.itemId);
    });
  }
}