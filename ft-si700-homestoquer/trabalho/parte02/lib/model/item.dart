import 'package:intl/intl.dart';

class Item {
  String _descricao = "";
  String _marca = "";
  String _origem = "";
  double _preco = .0;
  String _unidade = "";
  int _quantidade = 0;
  int _minQuantidade = 0;

  Item() {
    _descricao = "";
    _marca = "";
    _origem = "";
    _preco = .0;
    _unidade = "";
    _quantidade = 0;
    _minQuantidade = 0;
  }

  Item.withData({descricao = "", marca = "", origem = "", preco = "",
                unidade = "", quantidade = "", minQuantidade = ""}) {
    _descricao = descricao;
    _marca = marca;
    _origem = origem;
    _preco = preco;
    _unidade = unidade;
    _quantidade = quantidade;
    _minQuantidade = minQuantidade;
  }

  Item.fromMap(map) {
    _descricao = map["descricao"];
    _marca = map["marca"];
    _origem = map["origem"];
    _preco = map["preco"];
    _unidade = map["unidade"];
    _quantidade = map["quantidade"];
    _minQuantidade = map["minQuantidade"];
  }

  String get descricao => _descricao;
  String get marca => _marca;
  String get origem => _origem;
  double get preco => _preco;
  String get unidade => _unidade;
  int get quantidade => _quantidade;
  int get minQuantidade => _minQuantidade;

  set descricao(String newDescricao) {
    if (newDescricao.isNotEmpty) {
      _descricao = newDescricao;
    }
  }

  set marca(String newMarca) {
    if (newMarca.isNotEmpty) {
      _marca = newMarca;
    }
  }

  set origem(String newOrigem) {
    if (newOrigem.isNotEmpty) {
      _origem = newOrigem;
    }
  }

  set preco(double newMarca) {
    if (!newMarca.isNaN) {
      _preco = newMarca;
    }
  }

  set unidade(String newUnidade) {
    if (newUnidade.isNotEmpty) {
      _unidade = newUnidade;
    }
  }

  set quantidade(int newMarca) {
    if (!newMarca.isNaN) {
      _quantidade = newMarca;
    }
  }

  set minQuantidade(int newMarca) {
    if (!newMarca.isNaN) {
      _minQuantidade = newMarca;
    }
  }

  toMap() {
    var map = <String, dynamic>{};
    map["descricao"] = _descricao;
    map["marca"] = _marca;
    map["origem"] = _origem;
    map["preco"] = _preco;
    map["unidade"] = _unidade;
    map["quantidade"] = _quantidade;
    map["minQuantidade"] = _minQuantidade;
    return map;
  }
}

class Higiene extends Item {
  // Atributos
  String _funcao = "";

  Higiene() : super();

  Higiene.fromMap(map) {
    _descricao = map["descricao"];
    _marca = map["marca"];
    _origem = map["origem"];
    _preco = map["preco"];
    _unidade = map["unidade"];
    _quantidade = map["quantidade"];
    _minQuantidade = map["minQuantidade"];
    _funcao = map["funcao"];
  }

  String get funcao => _funcao;

  set funcao(String newFuncao) {
    if (newFuncao.isNotEmpty) {
      _funcao = newFuncao;
    }
  }

  @override
  toMap() {
    var map = <String, dynamic>{};
    map["descricao"] = _descricao;
    map["marca"] = _marca;
    map["origem"] = _origem;
    map["preco"] = _preco;
    map["unidade"] = _unidade;
    map["quantidade"] = _quantidade;
    map["minQuantidade"] = _minQuantidade;
    map['funcao'] = _funcao;
    return map;
  }
}

class Vestuario extends Item {
  // Atributos
  String _tecido = "";
  String _cor = "";
  bool _importado = false;

  Vestuario() : super();

  Vestuario.fromMap(map) {
    _descricao = map["descricao"];
    _marca = map["marca"];
    _origem = map["origem"];
    _preco = map["preco"];
    _unidade = map["unidade"];
    _quantidade = map["quantidade"];
    _minQuantidade = map["minQuantidade"];
    _tecido = map["tecido"];
    _cor = map["cor"];
    _importado = map["importado"];
  }

  String get tecido => _tecido;
  String get cor => _cor;
  bool get importado => _importado;

  set tecido(String newTecido) {
    if (newTecido.isNotEmpty) {
      _tecido = newTecido;
    }
  }

  set cor(String newCor) {
    if (newCor.isNotEmpty) {
      _cor = newCor;
    }
  }

  set importado(bool newImportado) {
    _importado = newImportado;
  }

  @override
  toMap() {
    var map = <String, dynamic>{};
    map["descricao"] = _descricao;
    map["marca"] = _marca;
    map["origem"] = _origem;
    map["preco"] = _preco;
    map["unidade"] = _unidade;
    map["quantidade"] = _quantidade;
    map["minQuantidade"] = _minQuantidade;
    map['tecido'] = _tecido;
    map['cor'] = _cor;
    map['importado'] = _importado;
    return map;
  }
}

class Cozinha extends Item {
  // Atributos
  String _categoria = "";
  DateTime _vencimento = DateTime.now();
  bool _precisaRefrigeracao = false;

  Cozinha() : super();

  Cozinha.fromMap(map) {
    _descricao = map["descricao"];
    _marca = map["marca"];
    _origem = map["origem"];
    _preco = map["preco"];
    _unidade = map["unidade"];
    _quantidade = map["quantidade"];
    _minQuantidade = map["minQuantidade"];
    _categoria = map["categoria"];
    _vencimento = (map["vencimento"]).toDate();
    _precisaRefrigeracao = map["precisaRefrigeracao"];
  }

  String get categoria => _categoria;
  DateTime get vencimento => _vencimento;
  bool get precisaRefrigeracao => _precisaRefrigeracao;

  set categoria(String newCategoria) {
    if (newCategoria.isNotEmpty) {
      _categoria = newCategoria;
    }
  }

  set vencimento(DateTime newVencimento) {
    _vencimento = newVencimento;
  }

  set precisaRefrigeracao(bool newRefrigeracao) {
    _precisaRefrigeracao = newRefrigeracao;
  }

  @override
  toMap() {
    var map = <String, dynamic>{};
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(_vencimento);

    map["descricao"] = _descricao;
    map["marca"] = _marca;
    map["origem"] = _origem;
    map["preco"] = _preco;
    map["unidade"] = _unidade;
    map["quantidade"] = _quantidade;
    map["minQuantidade"] = _minQuantidade;
    map['categoria'] = _categoria;
    map['vencimento'] = formatted;
    map['precisaRefrigeracao'] = _precisaRefrigeracao;
    return map;
  }
}