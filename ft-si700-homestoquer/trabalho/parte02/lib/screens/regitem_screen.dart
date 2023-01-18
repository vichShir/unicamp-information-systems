import 'package:si700_estoque/bloc/manage_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

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
        item = Item();
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
                    itemFields(item),
                    BlocBuilder<RadioBloc, int>(builder: (context, state) {
                      if(state == 0) {
                        Higiene hg = Higiene();
                        if(item is Higiene) {
                          hg = item;
                        }
                        return higieneFields(hg);
                      }
                      else if(state == 1) {
                        Cozinha cz = Cozinha();
                        if(item is Cozinha) {
                          cz = item;
                        }
                        return cozinhaFields(cz);
                      }
                      else if(state == 2) {
                        Vestuario vt = Vestuario();
                        if(item is Vestuario) {
                          vt = item;
                        }
                        return vestuarioFields(vt);
                      }
                      return Container();
                    }),
                    submitButton(context, state),
                    cancelButton(context, state),
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

  Widget itemFields(Item item){
    return Column(
      children: <Widget>[
        TextFormField(
          initialValue: item.descricao,
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
          initialValue: item.marca,
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
          initialValue: item.origem,
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
          initialValue: item.preco.toString(),
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
          initialValue: item.unidade,
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
        TextFormField(
          initialValue: item.quantidade.toString(),
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
          initialValue: item.minQuantidade.toString(),
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

  Widget higieneFields(Higiene hg) {
    return Column(
      children: <Widget>[
        TextFormField(
          initialValue: hg.funcao,
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

  Widget cozinhaFields(Cozinha cz) {
    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            TextFormField(
              initialValue: cz.categoria,
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
                String czVencimento = DateFormat('dd/MM/yyyy').format(cz.vencimento);
                String nowDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
                return TextFormField(
                  initialValue: czVencimento != nowDate ? czVencimento : "",
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
                    hintText: DateFormat('dd/MM/yyyy').format(state),
                    labelText: "Data de Vencimento",
                  ),
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

  Widget vestuarioFields(Vestuario vt) {
    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            TextFormField(
              initialValue: vt.tecido,
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
              initialValue: vt.cor,
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

  Widget submitButton(BuildContext context, ManageState state) {
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
          child: (state is UpdateState ? const Text("Atualizar") : const Text("Registrar")),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              if(higiene.funcao.isNotEmpty) {
                BlocProvider.of<ManageBloc>(context).add(SubmitEvent(higiene: higiene, cozinha: cozinha, vestuario: vestuario, itemType: 0));
              }
              else if(cozinha.categoria.isNotEmpty) {
                BlocProvider.of<ManageBloc>(context).add(SubmitEvent(higiene: higiene, cozinha: cozinha, vestuario: vestuario, itemType: 1));
              }
              else if(vestuario.tecido.isNotEmpty) {
                BlocProvider.of<ManageBloc>(context).add(SubmitEvent(higiene: higiene, cozinha: cozinha, vestuario: vestuario, itemType: 2));
              }
              formKey.currentState!.reset();

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.green,
                duration: const Duration(seconds: 3),
                content: (state is UpdateState ? const Text("Item Atualizado!") : const Text("Item Registrado!")),
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

  Widget cancelButton(BuildContext context, ManageState state) {
    return (state is UpdateState ? 
      SizedBox(
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
            child: const Text("Cancelar"),
            onPressed: () {
              BlocProvider.of<ManageBloc>(context).add(UpdateCancel());
            },
          ),
        ),
      ): Container()
    );
  }
}