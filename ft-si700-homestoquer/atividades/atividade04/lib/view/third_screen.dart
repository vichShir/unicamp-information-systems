import 'package:si700_estoque/bloc/manage_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/manage_event.dart';
import '../bloc/manage_state.dart';
import '../bloc/form_bloc.dart';
import '../model/item.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final Higiene higiene = Higiene();
  final Cozinha cozinha = Cozinha();
  final Vestuario vestuario = Vestuario();
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageBloc, ManageState>(builder: (context, state) {
      Item item;
      if (state is UpdateState) {
        item = state.previousItem;
      } else {
        item = Higiene();
      }
      return Scaffold(
        body: ListView(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    chooseItem(),
                    const Divider(thickness: 1),
                    itemFields(),
                    BlocBuilder<RadioBloc, int>(builder: (context, state) {
                      if(state == 0) {
                        return higieneFields();
                      }
                      else if(state == 1) {
                        return cozinhaFields();
                      }
                      else if(state == 2) {
                        return vestuarioFields();
                      }
                      return Container();
                    }),
                    submitButton(item, context, state),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
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
        BlocBuilder<RadioBloc, int>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    // Higiene Radio
                    Radio(
                      value: 0,
                      groupValue: state,
                      onChanged: (int? inValue) {
                        BlocProvider.of<RadioBloc>(context).add(inValue!);
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
                      groupValue: state,
                      onChanged: (int? inValue) {
                        BlocProvider.of<RadioBloc>(context).add(inValue!);
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
                      groupValue: state,
                      onChanged: (int? inValue) {
                        BlocProvider.of<RadioBloc>(context).add(inValue!);
                      },
                    ),
                    const Text("Vestuário"),
                  ],
                ),
              ],
            );
          },
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
          onSaved: (value) {
            higiene.descricao = value!;
            cozinha.descricao = value;
            vestuario.descricao = value;
          },
        ),
        TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.branding_watermark),
            hintText: "Neat",
            labelText: "Marca",
          ),
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
          onSaved: (value) {
            higiene.marca = value!;
            cozinha.marca = value;
            vestuario.marca = value;
          },
        ),
        TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.location_pin),
            hintText: "Supermercado Enxuto",
            labelText: "Origem",
          ),
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
          onSaved: (value) {
            higiene.origem = value!;
            cozinha.origem = value;
            vestuario.origem = value;
          },
        ),
        TextFormField(
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(
            icon: Icon(Icons.attach_money),
            hintText: "1.99",
            labelText: "Preço",
          ),
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
          onSaved: (value) {
            higiene.preco = double.parse(value!);
            cozinha.preco = double.parse(value);
            vestuario.preco = double.parse(value);
          },
        ),
        TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.confirmation_number),
            hintText: "UN",
            labelText: "Unidade",
          ),
          validator: (String? value) {
            if (value != null) {
              if (value.isEmpty) {
                return "Preencha a unidade do item";
              } else {
                return null;
              }
            } else {
              return "Algo errado ocorreu";
            }
          },
          onSaved: (value) {
            higiene.unidade = value!;
            cozinha.unidade = value;
            vestuario.unidade = value;
          },
        ),
        /*Row(
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
        ),*/
        TextFormField(
          keyboardType: const TextInputType.numberWithOptions(decimal: false),
          decoration: const InputDecoration(
            icon: Icon(Icons.numbers),
            hintText: "1",
            labelText: "Quantidade",
          ),
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
          onSaved: (value) {
            higiene.quantidade = int.parse(value!);
            cozinha.quantidade = int.parse(value);
            vestuario.quantidade = int.parse(value);
          },
        ),
        TextFormField(
          keyboardType: const TextInputType.numberWithOptions(decimal: false),
          decoration: const InputDecoration(
            icon: Icon(Icons.warning),
            hintText: "1",
            labelText: "Sempre manter",
          ),
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
          onSaved: (value) {
            higiene.minQuantidade = int.parse(value!);
            cozinha.minQuantidade = int.parse(value);
            vestuario.minQuantidade = int.parse(value);
          },
        ),
      ],
    );
  }

  Widget higieneFields() {
    return Column(
      children: <Widget>[
        TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.outlined_flag),
            hintText: "Rosto",
            labelText: "Função",
          ),
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
          onSaved: (value) {
            higiene.funcao = value!;
          },
        ),
      ],
    );
  }

  Widget cozinhaFields() {
    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.category),
                hintText: "Comida",
                labelText: "Categoria",
              ),
              validator: (String? value) {
                if (value != null) {
                  if (value.isEmpty) {
                    return "Preencha a categoria do item de cozinha";
                  } else {
                    return null;
                  }
                } else {
                  return "Algo errado ocorreu";
                }
              },
              onSaved: (value) {
                cozinha.categoria = value!;
              },
            ),
            BlocBuilder<DateBloc, DateTime>(
              builder: (context, state) {
                return TextFormField(
                  showCursor: true,
                  readOnly: true,
                  onTap: (){
                    showDatePicker(
                      context: context,
                      initialDate: state,
                      firstDate: DateTime(2001),
                      lastDate: DateTime(2050)
                    ).then((date) {
                      BlocProvider.of<DateBloc>(context).add(date!);
                    });
                  },
                  decoration: InputDecoration(
                    icon: const Icon(Icons.date_range),
                    hintText: state.toString(),
                    labelText: "Data de Vencimento",
                  ),
                  validator: (String? value) {},
                  onSaved: (value) {
                    cozinha.vencimento = state;
                  },
                );
              }
            ),
            SizedBox(
              height: 64,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: BlocBuilder<CheckBoxBloc, bool>(
                      builder: (context, state) {
                        return Checkbox(
                          value: state,
                          onChanged: (bool? newValue) {
                            BlocProvider.of<CheckBoxBloc>(context).add(newValue!);
                            cozinha.precisaRefrigeracao = newValue;
                          },
                        );
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
      ],
    );
  }

  Widget vestuarioFields() {
    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.turned_in),
                hintText: "Lã",
                labelText: "Tecido",
              ),
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
              onSaved: (value) {
                vestuario.tecido = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.color_lens),
                hintText: "Branco",
                labelText: "Cor da roupa",
              ),
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
              onSaved: (value) {
                vestuario.cor = value!;
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
                    child: BlocBuilder<CheckBoxBloc, bool>(
                      builder: (context, state) {
                        return Checkbox(
                          value: state,
                          onChanged: (bool? newValue) {
                            BlocProvider.of<CheckBoxBloc>(context).add(newValue!);
                            vestuario.importado = newValue;
                          },
                        );
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
      ]
    );
  }

  Widget submitButton(Item item, BuildContext context, ManageState state) {
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
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              if(higiene.funcao.isNotEmpty) {
                BlocProvider.of<ManageBloc>(context).add(SubmitEvent(item: higiene));
              }
              else if(cozinha.categoria.isNotEmpty) {
                BlocProvider.of<ManageBloc>(context).add(SubmitEvent(item: cozinha));
              }
              else if(vestuario.tecido.isNotEmpty) {
                BlocProvider.of<ManageBloc>(context).add(SubmitEvent(item: vestuario));
              }
              formKey.currentState!.reset();

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