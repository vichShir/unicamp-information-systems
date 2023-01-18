import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _checkboxCozinha = false;
  bool _checkboxVestuario = false;
  int _myRadio = -1;
  String dropdownValue = 'Unidade';
  List<String> tiposUnitarios = ["Unidade", "Quilograma", "Grama", "Litro", "Mililitro", "Caixa"];

  bool painelHigiene = false;
  bool painelCozinha = false;
  bool painelVestuario = false;

  DateTime _dataVencimento = DateTime.now().add(const Duration(days: 7));

  void showPainelHigiene(){
    painelHigiene = true;
    painelCozinha = false;
    painelVestuario = false;
  }

  void showPainelCozinha(){
    painelHigiene = false;
    painelCozinha = true;
    painelVestuario = false;
  }

  void showPainelVestuario(){
    painelHigiene = false;
    painelCozinha = false;
    painelVestuario = true;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  chooseItem(),
                  const Divider(thickness: 1),
                  itemFields(),
                  higieneFields(),
                  cozinhaFields(),
                  vestuarioFields(),
                  formButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget chooseItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          "Escolha um item:",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                // Higiene Radio
                Radio(
                  value: 0,
                  groupValue: _myRadio,
                  onChanged: (int? a) {
                    setState(() { 
                      _myRadio = a ?? 0;
                      showPainelHigiene();
                    });
                  },
                ),
                const Text("Higiene"),
              ],
            ),
            Row(
              children: <Widget>[
                // Cozinha Radio
                Radio(
                  value: 1,
                  groupValue: _myRadio,
                  onChanged: (int? a) {
                    setState(() {
                      _myRadio = a ?? 0;
                      showPainelCozinha();
                    });
                  },
                ),
                const Text("Cozinha"),
              ],
            ),
            Row(
              children: <Widget>[
                // Vestuário Radio
                Radio(
                  value: 2,
                  groupValue: _myRadio,
                  onChanged: (int? a) {
                    setState(() {
                      _myRadio = a ?? 0;
                      showPainelVestuario();
                    });
                  },
                ),
                const Text("Vestuário"),
              ],
            ),
          ],
        ),
      ]
    );
  }

  Widget itemFields(){
    return Column(
      children: <Widget>[
        TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.description),
            hintText: "Suco de Laranja 1,35LT",
            labelText: "Descrição",
          ),
          onSaved: (String? value) {},
          validator: (String? value) {
            if (value != null) {
              if (value.isEmpty) {
                return "Preencha a descrição do item";
              } else {
                return null;
              }
            } else {
              return "Algo errado ocorreu";
            }
          },
        ),
        TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.branding_watermark),
            hintText: "Neat",
            labelText: "Marca",
          ),
          onSaved: (String? value) {},
          validator: (String? value) {
            if (value != null) {
              if (value.isEmpty) {
                return "Preencha o nome da marca";
              } else {
                return null;
              }
            } else {
              return "Algo errado ocorreu";
            }
          },
        ),
        TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.location_pin),
            hintText: "Supermercado Enxuto",
            labelText: "Origem",
          ),
          onSaved: (String? value) {},
          validator: (String? value) {
            if (value != null) {
              if (value.isEmpty) {
                return "Preencha o nome de origem do item";
              } else {
                return null;
              }
            } else {
              return "Algo errado ocorreu";
            }
          },
        ),
        TextFormField(
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(
            icon: Icon(Icons.attach_money),
            hintText: "1.99",
            labelText: "Preço",
          ),
          onSaved: (String? value) {},
          validator: (String? value) {
            if (value != null) {
              if (value.isEmpty) {
                return "Preencha o preço de compra";
              } else {
                return null;
              }
            } else {
              return "Algo errado ocorreu";
            }
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Icon(
              Icons.amp_stories_outlined,
              color: Colors.black45,
              size: 28,
            ),
            Flexible(
              child: SizedBox(
                height: 64,
                width: 340,
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: dropdownValue,
                  style: const TextStyle(color: Colors.black54),
                  underline: Container(
                    height: 0.8,
                    color: Colors.black54,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: tiposUnitarios.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
        TextFormField(
          keyboardType: const TextInputType.numberWithOptions(decimal: false),
          decoration: const InputDecoration(
            icon: Icon(Icons.numbers),
            hintText: "1",
            labelText: "Quantidade",
          ),
          onSaved: (String? value) {},
          validator: (String? value) {
            if (value != null) {
              if (value.isEmpty) {
                return "Preencha a quantidade do item";
              } else {
                return null;
              }
            } else {
              return "Algo errado ocorreu";
            }
          },
        ),
        TextFormField(
          keyboardType: const TextInputType.numberWithOptions(decimal: false),
          decoration: const InputDecoration(
            icon: Icon(Icons.warning),
            hintText: "1",
            labelText: "Sempre manter",
          ),
          onSaved: (String? value) {},
          validator: (String? value) {
            if (value != null) {
              if (value.isEmpty) {
                return "Preencha o limite mínimo";
              } else {
                return null;
              }
            } else {
              return "Algo errado ocorreu";
            }
          },
        ),
      ],
    );
  }

  Widget higieneFields() {
    return Column(
      children: <Widget>[
        Visibility(
          visible: painelHigiene,
          child: TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.outlined_flag),
              hintText: "Rosto",
              labelText: "Função",
            ),
            onSaved: (String? value) {},
            validator: (String? value) {
              if (value != null) {
                if (value.isEmpty) {
                  return "Preencha a função do item de higiene";
                } else {
                  return null;
                }
              } else {
                return "Algo errado ocorreu";
              }
            },
          ),
        ),
      ],
    );
  }

  Widget cozinhaFields() {
    return Column(
      children: <Widget>[
        Visibility(
          visible: painelCozinha,
          child: Column(
            children: <Widget>[
              TextFormField(
                showCursor: true,
                readOnly: true,
                onTap: (){
                  showDatePicker(
                    context: context,
                    initialDate: _dataVencimento == null ? DateTime.now() : _dataVencimento,
                    firstDate: DateTime(2001),
                    lastDate: DateTime(2050)
                  ).then((date) {
                    setState(() {
                      _dataVencimento = date!;
                    });
                  });
                },
                decoration: InputDecoration(
                  icon: const Icon(Icons.date_range),
                  hintText: _dataVencimento == null ? 'Nothing has been picked yet' : _dataVencimento.toString(),
                  labelText: "Data de Vencimento",
                ),
                onSaved: (String? value) {},
                validator: (String? value) {},
              ),
              SizedBox(
                height: 64,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: Checkbox(
                        value: _checkboxCozinha,
                        onChanged: (bool? newValue) {
                          setState(() => _checkboxCozinha = newValue ?? false);
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 18),
                      child: const Text("Precisa de refrigeração"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget vestuarioFields() {
    return Column(
      children: <Widget>[
        Visibility(
          visible: painelVestuario,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.turned_in),
                  hintText: "Lã",
                  labelText: "Tecido",
                ),
                onSaved: (String? value) {},
                validator: (String? value) {
                  if (value != null) {
                    if (value.isEmpty) {
                      return "Preencha a tipo de tecido";
                    } else {
                      return null;
                    }
                  } else {
                    return "Algo errado ocorreu";
                  }
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.color_lens),
                  hintText: "Branco",
                  labelText: "Cor da roupa",
                ),
                onSaved: (String? value) {},
                validator: (String? value) {
                  if (value != null) {
                    if (value.isEmpty) {
                      return "Preencha a cor da roupa";
                    } else {
                      return null;
                    }
                  } else {
                    return "Algo errado ocorreu";
                  }
                },
              ),
              SizedBox(
                height: 64,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: Checkbox(
                        value: _checkboxVestuario,
                        onChanged: (bool? newValue) {
                          setState(() => _checkboxVestuario = newValue ?? false);
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 18),
                      child: const Text("Importado"),
                    ),
                  ],
                ),
              ),
            ]
          ),
        ),
      ]
    );
  }

  Widget formButton() {
    return SizedBox(
      height: 80,
      width: 220,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [BoxShadow(blurRadius: 6, color: Colors.black54)],
          gradient: const LinearGradient(
            colors: [Color.fromARGB(255, 230, 74, 25), Color.fromARGB(255, 247, 159, 31)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            minimumSize: MaterialStateProperty.all(const Size(220, 50)),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            elevation: MaterialStateProperty.all(3),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
          ),
          child: const Text("Registrar"),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.green,
                duration: const Duration(seconds: 3),
                content: const Text("Item registrado!"),
                action: SnackBarAction(
                  label: "Volte Sempre!",
                  onPressed: () {}
                  )
                )
              );
            }
          },
        ),
      ),
    );
  }
}