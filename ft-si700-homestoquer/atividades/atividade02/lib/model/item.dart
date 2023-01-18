enum TipoUnitario { naoDefinida, unidade, caixa, par, quilograma, grama, litro, mililitro }

abstract class Item {
  String _nome = "";
  String _marca = "";
  TipoUnitario _tipoUnitario = TipoUnitario.naoDefinida;
  double _quantidade = .0;

  // Getter
  String get descricao {
    return "$_nome da marca $_marca.";
  }

  String get medida {
    return _tipoUnitario.toString().split('.').last;
  }

  TipoUnitario get tipoUnitario {
    return _tipoUnitario;
  }

  double get quantidade {
    return _quantidade;
  }

  // Setter
  set nome(n) {
    _nome = n;
  }

  set marca(m) {
    _marca = m;
  }

  set tipoUnitario(tu) {
    _tipoUnitario = tu;
  }

  set quantidade(q) {
    _quantidade = q.toDouble();
  }

  displayInfo();

  displayName() {
    return "Nome: $_nome";
  }
}

class Higiene extends Item {
  // Atributos
  String _funcao = "";

  Higiene(n, m, tu, q, fc) {
    _nome = n;
    _marca = m;
    _tipoUnitario = tu;
    quantidade = q;
    _funcao = fc;
  }

  @override
  displayInfo() {
    return descricao + """\n
    Quantidade disponível: $_quantidade;
    Unidade de medida: $medida;
    Aplicação: $_funcao;
    """;
  }
}

class Vestuario extends Item {
  // Atributos
  String _tecido = "";
  String _cor = "";
  bool _importado = false;

  Vestuario(n, m, tu, q, t, c, i) {
    _nome = n;
    _marca = m;
    _tipoUnitario = tu;
    quantidade = q;
    _tecido = t;
    _cor = c;
    _importado = i;

    // Exception
    if(tu == TipoUnitario.naoDefinida) {
      throw const FormatException("Informe uma medida.");
    }
    else if (tu == TipoUnitario.litro || tu == TipoUnitario.mililitro) {
      throw Exception("Medida inválida para vestuário.");
    }
  }

  @override
  displayInfo() {
    return descricao + """\n
    Quantidade disponível: $_quantidade;
    Unidade de medida: $medida;
    Tecido: $_tecido;
    Cor: $_cor;
    Importado: $_importado.
    """;
  }
}

class Cozinha extends Item {
  // Atributos
  DateTime _vencimento = DateTime.now().add(const Duration(days: 7));
  bool _precisaRefrigeracao = false;

  Cozinha(n, m, tu, q, vt, rf) {
    _nome = n;
    _marca = m;
    _tipoUnitario = tu;
    quantidade = q;
    _vencimento = vt;
    _precisaRefrigeracao = rf;
  }

  @override
  displayInfo() {
    int vencimentoDia = _vencimento.day;
    int vencimentoMes = _vencimento.month;
    int vencimentoAno = _vencimento.year;

    return descricao + """\n
    Quantidade disponível: $_quantidade;
    Unidade de medida: $medida;
    Data de vencimento: $vencimentoDia/$vencimentoMes de $vencimentoAno;
    Colocar na geladeira: $_precisaRefrigeracao.
    """;
  }
}