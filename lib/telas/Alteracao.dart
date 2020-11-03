import 'package:flutter/material.dart';
import 'package:projetodps/componentes/Botao.dart';

class Alteracao extends StatefulWidget {
  @override
  _AlteracaoState createState() => _AlteracaoState();
}

class _AlteracaoState extends State<Alteracao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Center(
              child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20),
                  child: Botao(
                      texto: 'alterações no usuário',
                      aoPressionar: () =>
                          Navigator.pushNamed(context, '/alteracaousuario'),
                      habilitar: true)),
              Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0),
                  child: Botao(
                    texto: 'alterações no paciente',
                    aoPressionar: () {
                      Navigator.pushNamed(context, '/alteracaopacientes');
                    },
                    habilitar: true,
                  )),
            ],
          )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          backgroundColor: Theme.of(context).backgroundColor,
          child: Icon(Icons.arrow_back),
        ));
  }
}
