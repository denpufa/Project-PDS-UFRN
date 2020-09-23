import 'package:projetodps/componentes/Botao.dart';
import 'package:flutter/material.dart';
import 'package:projetodps/repositorios/ApiRepositorio.dart';

class CadastroP extends StatefulWidget {
  @override
  _CadastroPState createState() => _CadastroPState();
}

class _CadastroPState extends State<CadastroP> {
  GlobalKey<FormState> _chave = GlobalKey();

  TextEditingController _cnome = TextEditingController(text: "");
  TextEditingController _ccpf = TextEditingController(text: "");
  TextEditingController _csus = TextEditingController(text: "");
  TextEditingController _ccidade = TextEditingController(text: "");
  TextEditingController _cbairro = TextEditingController(text: "");
  TextEditingController _ccomplemento = TextEditingController(text: "");
  TextEditingController _cdatanasc = TextEditingController(text: "");
  TextEditingController _ctelefone = TextEditingController(text: "");

  void _resetarcampos() {
    _cnome.text = "";
    _ccpf.text = "";
    _csus.text = "";
    _ccidade.text = "";
    _cbairro.text = "";
    _ccomplemento.text = "";
    _cdatanasc.text = "";
    _ctelefone.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SISMAC",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          FlatButton(
            child: Text(
              "VOLTAR",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 100.0, 10.0, 0.0),
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Text(
              "Preencha os dados",
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 19),
            ),
            Form(
                key: _chave,
                child: Column(children: <Widget>[
                  Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 12.0),
                      child: TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 0.6),
                                borderRadius: BorderRadius.circular(15)),
                            labelText: "nome",
                            labelStyle: TextStyle(
                                color: Colors.blueGrey[300], fontSize: 15),
                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black, fontSize: 15),
                          controller: _cnome,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "insira seu nome por favor!";
                            }
                          })),
                  Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 12.0),
                      child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 0.6),
                                borderRadius: BorderRadius.circular(15)),
                            labelText: "cpf",
                            labelStyle: TextStyle(
                                color: Colors.blueGrey[300], fontSize: 15),
                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black, fontSize: 15),
                          controller: _ccpf,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "insira seu cpf por favor!";
                            }
                          })),
                  Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 12.0),
                      child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 0.6),
                                borderRadius: BorderRadius.circular(15)),
                            labelText: "carteira sus",
                            labelStyle: TextStyle(
                                color: Colors.blueGrey[300], fontSize: 15),
                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black, fontSize: 15),
                          controller: _csus,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "insira sua carteira do sus por favor!";
                            }
                          })),
                  Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 12.0),
                      child: TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 0.6),
                                borderRadius: BorderRadius.circular(15)),
                            labelText: "cidade",
                            labelStyle: TextStyle(
                                color: Colors.blueGrey[300], fontSize: 15),
                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black, fontSize: 15),
                          controller: _ccidade,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "insira sua cidade por favor!";
                            }
                          })),
                  Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 12.0),
                      child: TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 0.6),
                                borderRadius: BorderRadius.circular(15)),
                            labelText: "bairro",
                            labelStyle: TextStyle(
                                color: Colors.blueGrey[300], fontSize: 15),
                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black, fontSize: 15),
                          controller: _cbairro,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "insira seu bairro por favor!";
                            }
                          })),
                  Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 12.0),
                      child: TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 0.6),
                                borderRadius: BorderRadius.circular(15)),
                            labelText: "complemento",
                            labelStyle: TextStyle(
                                color: Colors.blueGrey[300], fontSize: 15),
                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black, fontSize: 15),
                          controller: _ccomplemento,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "insira seu complemento por favor!";
                            }
                          })),
                  Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 12.0),
                      child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 0.6),
                                borderRadius: BorderRadius.circular(15)),
                            labelText: "telefone",
                            labelStyle: TextStyle(
                                color: Colors.blueGrey[300], fontSize: 15),
                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black, fontSize: 15),
                          controller: _ctelefone,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "insira seu telefone por favor!";
                            }
                          })),
                  Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 0),
                      child: Botao(
                          habilitar: true,
                          cor: Colors.white,
                          corTexto: Theme.of(context).primaryColor,
                          texto: "data de nascimento",
                          aoPressionar: () async {
                            //Navigator.pushNamed(context, '/usuario');
                            DateTime data = await showDatePicker(
                              context: context,
                              initialDate: DateTime(1900),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );
                          })),
                ])),
            Padding(
              padding:
                  EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 10),
              child: Botao(
                habilitar: true,
                aoPressionar: () {
                  if (_chave.currentState.validate()) {
                    ApiRepositorio.cadastrar_paciente(
                        _cnome.text,
                        _ccpf.text,
                        _csus.text,
                        _ccidade.text,
                        _cbairro.text,
                        _ccomplemento.text,
                        _cdatanasc.text,
                        _ctelefone.text);
                    _resetarcampos();
                  }
                },
                texto: "cadastrar",
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
