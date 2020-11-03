import 'package:flutter/material.dart';
import 'package:projetodps/componentes/Alerta.dart';
import 'package:projetodps/componentes/Botao.dart';
import 'package:projetodps/repositorios/ApiRepositorio.dart';

class AlteracaoU extends StatefulWidget {
  @override
  _AlteracaoUState createState() => _AlteracaoUState();
}

class _AlteracaoUState extends State<AlteracaoU> {
  var _key = GlobalKey<FormState>();
  var _nome = TextEditingController(text: "");
  var _email = TextEditingController(text: "");
  var _senha = TextEditingController(text: "");
  bool _botaoPress = false;

  _resetarCampos() {
    _nome.text = "";
    _email.text = "";
    _senha.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'SISMAC',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: <Widget>[
          Alerta(
              titulo: 'alteração',
              recado:
                  'preencha os campos que desejar alterar ,o resto pode deixar em branco'),
          Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 15.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 0.6),
                              borderRadius: BorderRadius.circular(15)),
                          labelText: "nome",
                          hintText: "seu nome completo",
                          labelStyle: TextStyle(
                              color: Colors.blueGrey[300], fontSize: 15),
                        ),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 15),
                        controller: _nome,
                      )),
                  Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 15.0),
                      child: TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 0.6),
                                borderRadius: BorderRadius.circular(15)),
                            labelText: "email",
                            labelStyle: TextStyle(
                                color: Colors.blueGrey[300], fontSize: 15),
                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black, fontSize: 15),
                          controller: _email,
                          validator: (value) {
                            if (!value.contains('@')) {
                              return "insira um email válido por favor!";
                            }
                          })),
                  Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 15.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 0.6),
                              borderRadius: BorderRadius.circular(15)),
                          labelText: "senha",
                          hintText: "senha",
                          labelStyle: TextStyle(
                              color: Colors.blueGrey[300], fontSize: 15),
                        ),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 15),
                        controller: _senha,
                      )),
                ],
              )),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Botao(
                habilitar: !_botaoPress,
                texto: 'Atualizar',
                aoPressionar: () {
                  setState(() {
                    _botaoPress = !_botaoPress;
                  });
                  ApiRepositorio.alterar_usuario(
                      _nome.text, _email.text, _senha.text, context);

                  setState(() {
                    _resetarCampos();
                    _botaoPress = !_botaoPress;
                  });
                }),
          )
        ],
      ),
    );
  }
}
