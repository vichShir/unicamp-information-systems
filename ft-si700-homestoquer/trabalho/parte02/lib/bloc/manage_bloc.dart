import 'package:si700_estoque/bloc/manage_event.dart';
import 'package:si700_estoque/provider/firebase_firestore.dart';
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
        if(event.itemType == 0) {
          FirestoreServer.helper.insertItemHigiene(event.higiene);
        }
        else if(event.itemType == 1) {
          FirestoreServer.helper.insertItemCozinha(event.cozinha);
        }
        else if(event.itemType == 2) {
          FirestoreServer.helper.insertItemVestuario(event.vestuario);
        }
      } else if (state is UpdateState) {
        if(event.itemType == 0) {
          FirestoreServer.helper.updateItemHigiene((state as UpdateState).itemId, event.higiene);
        }
        else if(event.itemType == 1) {
          FirestoreServer.helper.updateItemCozinha((state as UpdateState).itemId, event.cozinha);
        }
        else if(event.itemType == 2) {
          FirestoreServer.helper.updateItemVestuario((state as UpdateState).itemId, event.vestuario);
        }
      }
    });

    on<DeleteEvent>((event, emit) {
      FirestoreServer.helper.deleteItem(event.itemId);
    });
  }
}