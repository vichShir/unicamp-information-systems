import 'dart:math';
import 'item.dart';

class ItemCollection {
  List<String> idList = [];
  List<Item> itemList = [];

  ItemCollection() {
    idList = [];
    itemList = [];
  }

  int length() {
    return idList.length;
  }

  Item getItemAtIndex(int index) {
    return itemList[index];
  }

  String getIdAtIndex(int index) {
    return idList[index];
  }

  int getIndexOfId(String id) {
    for (int i = 0; i < idList.length; i++) {
      if (id == idList[i]) {
        return i;
      }
    }
    return -1;
  }

  bool isHigiene(int position) {
    return getItemAtIndex(position) is Higiene;
  }

  bool isCozinha(int position) {
    return getItemAtIndex(position) is Cozinha;
  }

  bool isVestuario(int position) {
    return getItemAtIndex(position) is Vestuario;
  }

  int getIndexOfIcon(int position) {
    if(isHigiene(position)) {
      return 0;
    } else if(isCozinha(position)) {
      return 1;
    } else {
      return 2;
    }
  }

  int countHigiene(){
    int count = 0;
    for (int i = 0; i < idList.length; i++) {
      if (isHigiene(i)) {
        count++;
      }
    }
    return count;
  }

  int countCozinha(){
    int count = 0;
    for (int i = 0; i < idList.length; i++) {
      if (isCozinha(i)) {
        count++;
      }
    }
    return count;
  }

  int countVestuario(){
    int count = 0;
    for (int i = 0; i < idList.length; i++) {
      if (isVestuario(i)) {
        count++;
      }
    }
    return count;
  }

  double minPriceHigiene(){
    List<double> hgList = [];
    for (int i = 0; i < idList.length; i++) {
      if (isHigiene(i)) {
        hgList.add(getItemAtIndex(i).preco);
      }
    }
    if(hgList.isEmpty) return 0;
    return hgList.reduce(min);
  }

  double meanPriceHigiene(){
    List<double> hgList = [];
    for (int i = 0; i < idList.length; i++) {
      if (isHigiene(i)) {
        hgList.add(getItemAtIndex(i).preco);
      }
    }
    if(hgList.isEmpty) return 0;
    return hgList.reduce((x, y) => x + y) / hgList.length;
  }

  double maxPriceHigiene(){
    List<double> hgList = [];
    for (int i = 0; i < idList.length; i++) {
      if (isHigiene(i)) {
        hgList.add(getItemAtIndex(i).preco);
      }
    }
    if(hgList.isEmpty) return 0;
    return hgList.reduce(max);
  }

  double minPriceCozinha(){
    List<double> hgList = [];
    for (int i = 0; i < idList.length; i++) {
      if (isCozinha(i)) {
        hgList.add(getItemAtIndex(i).preco);
      }
    }
    if(hgList.isEmpty) return 0;
    return hgList.reduce(min);
  }

  double meanPriceCozinha(){
    List<double> hgList = [];
    for (int i = 0; i < idList.length; i++) {
      if (isCozinha(i)) {
        hgList.add(getItemAtIndex(i).preco);
      }
    }
    if(hgList.isEmpty) return 0;
    return hgList.reduce((x, y) => x + y) / hgList.length;
  }

  double maxPriceCozinha(){
    List<double> hgList = [];
    for (int i = 0; i < idList.length; i++) {
      if (isCozinha(i)) {
        hgList.add(getItemAtIndex(i).preco);
      }
    }
    if(hgList.isEmpty) return 0;
    return hgList.reduce(max);
  }

  double minPriceVestuario(){
    List<double> hgList = [];
    for (int i = 0; i < idList.length; i++) {
      if (isVestuario(i)) {
        hgList.add(getItemAtIndex(i).preco);
      }
    }
    if(hgList.isEmpty) return 0;
    return hgList.reduce(min);
  }

  double meanPriceVestuario(){
    List<double> hgList = [];
    for (int i = 0; i < idList.length; i++) {
      if (isVestuario(i)) {
        hgList.add(getItemAtIndex(i).preco);
      }
    }
    if(hgList.isEmpty) return 0;
    return hgList.reduce((x, y) => x + y) / hgList.length;
  }

  double maxPriceVestuario(){
    List<double> hgList = [];
    for (int i = 0; i < idList.length; i++) {
      if (isVestuario(i)) {
        hgList.add(getItemAtIndex(i).preco);
      }
    }
    if(hgList.isEmpty) return 0;
    return hgList.reduce(max);
  }

  updateOrInsertItemOfId(String id, Item item) {
    int index = getIndexOfId(id);
    if (index != -1) {
      itemList[index] = item;
    } else {
      idList.add(id);
      itemList.add(item);
    }
  }

  updateItemOfId(String id, Item item) {
    int index = getIndexOfId(id);
    if (index != -1) {
      itemList[index] = item;
    }
  }

  deleteItemOfId(String id) {
    int index = getIndexOfId(id);
    if (index != -1) {
      itemList.removeAt(index);
      idList.removeAt(index);
    }
  }

  insertItemOfId(String id, Item item) {
    idList.add(id);
    itemList.add(item);
  }
}