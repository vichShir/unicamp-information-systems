import '../model/item.dart';
import '../model/itens.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServer {
  // Atributo que irá afunilar todas as consultas
  static FirestoreServer helper = FirestoreServer._createInstance();
  // Construtor privado
  FirestoreServer._createInstance();

  // uid do usuário logado
  String? uid;

  // Ponto de acesso com o servidor
  final CollectionReference noteCollection = FirebaseFirestore.instance.collection("items");

  Future<Item> getItem(noteId) async {
    DocumentSnapshot doc = await noteCollection.doc(uid).collection("my_items").doc(noteId).get();

    if((doc.data() as Map<String,dynamic>).containsKey('funcao')) {
      Higiene higiene = Higiene.fromMap(doc.data());
      return higiene;
    }
    else if((doc.data() as Map<String,dynamic>).containsKey('vencimento')) {
      Cozinha cozinha = Cozinha.fromMap(doc.data());
      return cozinha;
    }
    else if((doc.data() as Map<String,dynamic>).containsKey('tecido')) {
      Vestuario vestuario = Vestuario.fromMap(doc.data());
      return vestuario;
    }

    return Higiene();
  }

  Future<int> insertItemHigiene(Higiene note) async {
    await noteCollection.doc(uid).collection("my_items").add({
      "descricao": note.descricao,
      "marca": note.marca,
      "origem": note.origem,
      "preco": note.preco,
      "unidade": note.unidade,
      "quantidade": note.quantidade,
      "minQuantidade": note.minQuantidade,
      "funcao": note.funcao
    });
    return 42;
  }

  Future<int> insertItemCozinha(Cozinha note) async {
    await noteCollection.doc(uid).collection("my_items").add({
      "descricao": note.descricao,
      "marca": note.marca,
      "origem": note.origem,
      "preco": note.preco,
      "unidade": note.unidade,
      "quantidade": note.quantidade,
      "minQuantidade": note.minQuantidade,
      "categoria": note.categoria,
      "vencimento": note.vencimento,
      "precisaRefrigeracao": note.precisaRefrigeracao
    });
    return 42;
  }

  Future<int> insertItemVestuario(Vestuario note) async {
    await noteCollection.doc(uid).collection("my_items").add({
      "descricao": note.descricao,
      "marca": note.marca,
      "origem": note.origem,
      "preco": note.preco,
      "unidade": note.unidade,
      "quantidade": note.quantidade,
      "minQuantidade": note.minQuantidade,
      "tecido": note.tecido,
      "cor": note.cor,
      "importado": note.importado
    });
    return 42;
  }

  Future<int> updateItemHigiene(noteId, Higiene note) async {
    await noteCollection.doc(uid).collection("my_items").doc(noteId).update({
      "descricao": note.descricao,
      "marca": note.marca,
      "origem": note.origem,
      "preco": note.preco,
      "unidade": note.unidade,
      "quantidade": note.quantidade,
      "minQuantidade": note.minQuantidade,
      "funcao": note.funcao
    });
    return 42;
  }

  Future<int> updateItemCozinha(noteId, Cozinha note) async {
    await noteCollection.doc(uid).collection("my_items").doc(noteId).update({
      "descricao": note.descricao,
      "marca": note.marca,
      "origem": note.origem,
      "preco": note.preco,
      "unidade": note.unidade,
      "quantidade": note.quantidade,
      "minQuantidade": note.minQuantidade,
      "categoria": note.categoria,
      "vencimento": note.vencimento,
      "precisaRefrigeracao": note.precisaRefrigeracao
    });
    return 42;
  }

  Future<int> updateItemVestuario(noteId, Vestuario note) async {
    await noteCollection.doc(uid).collection("my_items").doc(noteId).update({
      "descricao": note.descricao,
      "marca": note.marca,
      "origem": note.origem,
      "preco": note.preco,
      "unidade": note.unidade,
      "quantidade": note.quantidade,
      "minQuantidade": note.minQuantidade,
      "tecido": note.tecido,
      "cor": note.cor,
      "importado": note.importado
    });
    return 42;
  }

  Future<int> deleteItem(noteId) async {
    await noteCollection.doc(uid).collection("my_items").doc(noteId).delete();
    return 42;
  }

  ItemCollection _itemListFromSnapshot(QuerySnapshot snapshot) {
    ItemCollection noteCollection = ItemCollection();
    for (var doc in snapshot.docs) {
      if((doc.data() as Map<String,dynamic>).containsKey('funcao')) {
        Higiene higiene = Higiene.fromMap(doc.data());
        noteCollection.insertItemOfId(doc.id, higiene);
      }
      else if((doc.data() as Map<String,dynamic>).containsKey('vencimento')) {
        Cozinha cozinha = Cozinha.fromMap(doc.data());
        noteCollection.insertItemOfId(doc.id, cozinha);
      }
      else if((doc.data() as Map<String,dynamic>).containsKey('tecido')) {
        Vestuario vestuario = Vestuario.fromMap(doc.data());
        noteCollection.insertItemOfId(doc.id, vestuario);
      }
    }
    return noteCollection;
  }

  Future<ItemCollection> getItemList() async {
    QuerySnapshot snapshot = await noteCollection.doc(uid).collection("my_items").get();

    return _itemListFromSnapshot(snapshot);
  }

  Stream get stream {
    return noteCollection.doc(uid).collection("my_items").snapshots().map(_itemListFromSnapshot);
  }
}
