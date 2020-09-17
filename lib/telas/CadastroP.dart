import 'package:projetodps/componentes/Botao.dart';
import 'package:projetodps/telas_logica/Log_cadastro.dart';
import 'package:flutter/material.dart';
import 'package:projetodps/componentes/Inputtoform.dart';

class CadastroP extends StatefulWidget {
  @override
  _CadastroPState createState() => _CadastroPState();
}

class _CadastroPState extends State<CadastroP> {
  GlobalKey<FormState> _chave = GlobalKey();

  TextEditingController cnome = TextEditingController(text: "");
  TextEditingController ccpf = TextEditingController(text: "");
  TextEditingController csus = TextEditingController(text: "");

  void _resetarcampos() {
    cnome.text = "";
    ccpf.text = "";
    csus.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 150.0, 10.0, 0.0),
          child: Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Form(
                  key: _chave,
                  child: Column(
                    children: <Widget>[
                      ,
                      SizedBox(
                        height: 12,
                      ),
                      Inputtoform("cpf", TextInputType.number, ccpf, 'c'),
                      SizedBox(height: 12),
                      Inputtoform(
                          "carteira do sus", TextInputType.number, csus, 'c'),
                      SizedBox(height: 12),
                    ],
                  )),
              SizedBox(
                height: 25,
              ),
              Container(
                width: 300,
                child: RaisedButton(
                  color: Colors.greenAccent,
                  onPressed: () {
                    if (_chave.currentState.validate()) {
                      Log_cadastro.submeter();
                      _resetarcampos();
                    }
                  },
                  child: Text(
                    "cadastrar",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              )
            ],
          ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        backgroundColor: Colors.greenAccent,
      ),
    );
  }
}
