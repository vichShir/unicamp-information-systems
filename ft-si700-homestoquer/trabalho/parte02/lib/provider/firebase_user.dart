import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user_model.dart';

class FirebaseUserInfo {
  // Atributo que irá afunilar todas as consultas
  static FirebaseUserInfo helper = FirebaseUserInfo._createInstance();

  // Construtor privado
  FirebaseUserInfo._createInstance();

  // uid do usuário logado
  String? uid;

  // Ponto de acesso com o servidor
  final CollectionReference userCollection = FirebaseFirestore.instance.collection("users");

  Future<UserInfo> getUser() async {
    DocumentSnapshot doc = await userCollection.doc(uid).get();
    UserInfo user = UserInfo.fromMap(doc.data());
    return user;
  }

  Future<int> insertUser(UserInfo user) async {
    await userCollection.doc(uid).set({
      "nome": user.nome,
      "endereco": user.endereco,
      "telefone": user.telefone,
    });
    return 42;
  }
}
