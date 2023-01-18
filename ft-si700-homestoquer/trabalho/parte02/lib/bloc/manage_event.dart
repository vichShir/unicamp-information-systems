import '../model/item.dart';

abstract class ManageEvent {}

class SubmitEvent extends ManageEvent {
  Higiene higiene;
  Cozinha cozinha;
  Vestuario vestuario;
  int itemType;
  SubmitEvent({required this.higiene, required this.cozinha, required this.vestuario, required this.itemType});
}

class DeleteEvent extends ManageEvent {
  String itemId;
  DeleteEvent({required this.itemId});
}

class UpdateRequest extends ManageEvent {
  String itemId;
  Item previousItem;
  UpdateRequest({required this.itemId, required this.previousItem});
}

class UpdateCancel extends ManageEvent {}