// Data Provider para o banco de dados local sqflite
import 'dart:convert';
import 'package:dio/dio.dart';

import '../model/item.dart';
import '../model/itens.dart';

class RestServer {
  // Atributo que irá afunilar todas as consultas
  static RestServer helper = RestServer._createInstance();

  // Construtor privado
  RestServer._createInstance();

  final Dio _dio = Dio();
  String prefixUrl = "https://si7001s2022-b1472-default-rtdb.firebaseio.com";
  String suffixUrl = "/.json";

  Future<Item> getItem(itemId) async {
    Response response = await _dio.get(prefixUrl + itemId + suffixUrl);
    //return Item.fromMap(response.data);
    return Higiene();
  }

  Future<void> insertItem(Item item) async {
    Response response = await _dio.post(
      prefixUrl + suffixUrl,
      data: item.toMap(),
    );
    //return 42;
  }

  Future<int> updateItem(itemId, Item item) async {
    Response response = await _dio.put(
      prefixUrl + "/" + itemId + suffixUrl,
      data: item.toMap(),
    );
    return 42;
  }

  Future<int> deleteItem(itemId) async {
    Response response = await _dio.delete(prefixUrl + "/" + itemId + suffixUrl);
    return 42;
  }

  Future<ItemCollection> getItemList() async {
    Response response = await _dio.get(prefixUrl + suffixUrl);
    ItemCollection itemCollection = ItemCollection();

    response.data.forEach((key, value) {
      if(value.containsKey("funcao")) {
        Higiene higiene = Higiene.fromMap(value);
        itemCollection.insertItemOfId(key, higiene);
      }
      else if(value.containsKey("vencimento")) {
        Cozinha cozinha = Cozinha.fromMap(value);
        itemCollection.insertItemOfId(key, cozinha);
      }
      else if(value.containsKey("tecido")) {
        Vestuario vestuario = Vestuario.fromMap(value);
        itemCollection.insertItemOfId(key, vestuario);
      }
    });
    return itemCollection;
  }
}