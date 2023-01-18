class UserModel {
  final String uid;

  UserModel(this.uid);
}

class UserInfo {
  String nome = "";
  String endereco = "";
  String telefone = "";

  UserInfo() {
    nome = "";
    endereco = "";
    telefone = "";
  }

  UserInfo.withData(_nome, _endereco, _telefone) {
    nome = _nome;
    endereco = _endereco;
    telefone = _telefone;
  }

  UserInfo.fromMap(map) {
    nome = map["nome"];
    endereco = map["endereco"];
    telefone = map["telefone"];
  }

  toMap() {
    var map = <String, dynamic>{};
    map["nome"] = nome;
    map["endereco"] = endereco;
    map["telefone"] = telefone;
    return map;
  }
}