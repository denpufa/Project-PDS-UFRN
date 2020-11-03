import 'package:flutter/material.dart';
import 'package:projetodps/componentes/Botao.dart';
import 'package:projetodps/repositorios/ApiRepositorio.dart';

class VerificacaoU extends StatefulWidget {
  @override
  _VerificacaoUState createState() => _VerificacaoUState();
}

class _VerificacaoUState extends State<VerificacaoU> {
  var _key = GlobalKey<FormState>();
  var _codigo = TextEditingController(text: "");

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
            onPressed: () => Navigator.pushNamed(context, '/'),
          )
        ],
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
          Widget>[
        Text("Confirme uma código que foi enviado para seu e-mail",
            style:
                TextStyle(color: Theme.of(context).primaryColor, fontSize: 16)),
        Form(
          key: _key,
          child: Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 15.0),
              child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 0.6),
                        borderRadius: BorderRadius.circular(15)),
                    labelText: "código",
                    hintText: "token de validação ",
                    labelStyle:
                        TextStyle(color: Colors.blueGrey[300], fontSize: 15),
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 15),
                  controller: _codigo,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "insira o token   por favor!";
                    }
                  })),
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(80.0, 20.0, 80.0, 0),
            child: Botao(
                habilitar: true,
                texto: "Confirmar",
                aoPressionar: () {
                  if (_key.currentState.validate()) {
                    ApiRepositorio.validacao(
                        _codigo.text, ApiRepositorio.usuario['id'], context);
                  }
                }))
      ]),
    );
  }
}
