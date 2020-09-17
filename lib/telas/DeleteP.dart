import 'package:projetodps/componentes/Botao.dart';
import 'package:projetodps/componentes/Inputtoform.dart';
import 'package:flutter/material.dart';
import 'package:projetodps/servicos/Httptype.dart';

class DeleteP extends StatefulWidget {
  @override
  _DeletePState createState() => _DeletePState();
}

TextEditingController ccpf = TextEditingController(text: "");
TextEditingController csus = TextEditingController(text: "");

FutureBuilder _submeter() {
  String valor;
  if (ccpf.text.length == 11) {
    valor = ccpf.text;
  } else {
    valor = csus.text;
  }
  return FutureBuilder(
      future: Httptype.deleteP(valor),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            AlertDialog(
              title: Text("Remoção"),
              content: Text("Houve um erro de conexão"),
              contentTextStyle: TextStyle(color: Colors.black),
              backgroundColor: Colors.greenAccent,
              actions: <Widget>[Button("ok", 3)],
            );
            break;
          default:
            if (snapshot.hasError) {
              AlertDialog(
                title: Text("Remoção"),
                content: Text("Houve um erro"),
                contentTextStyle: TextStyle(color: Colors.black),
                backgroundColor: Colors.greenAccent,
                actions: <Widget>[Button("ok", 3)],
              );
            } else if (snapshot.data == true) {
              AlertDialog(
                title: Text("Remoção"),
                content: Text("Removido com sucesso"),
                contentTextStyle: TextStyle(color: Colors.black),
                backgroundColor: Colors.greenAccent,
                actions: <Widget>[Button("ok", 3)],
              );
            } else {
              AlertDialog(
                title: Text("Remoção"),
                content: Text("Usuário não encontrado"),
                contentTextStyle: TextStyle(color: Colors.black),
                backgroundColor: Colors.greenAccent,
                actions: <Widget>[Button("ok", 3)],
              );
            }
        }
      });
}

void _resetarcampos() {
  ccpf.text = "";
  csus.text = "";
}

class _DeletePState extends State<DeleteP> {
  GlobalKey<FormState> _chave = GlobalKey();
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
                      Text(
                        "Digitar apenas um é suficiente",
                        style: TextStyle(
                            color: Colors.black,
                            backgroundColor: Colors.greenAccent),
                      ),
                      Inputtoform("cpf", TextInputType.number, ccpf, 'd'),
                      SizedBox(height: 12),
                      Inputtoform(
                          "carteira do sus", TextInputType.number, csus, 'd'),
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
                      _submeter();
                      _resetarcampos();
                    }
                  },
                  child: Text(
                    "deletar",
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
