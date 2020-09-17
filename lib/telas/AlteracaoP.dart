import 'package:flutter/material.dart';
import 'package:projetodps/componentes/Botao.dart';

class AlteracaoP extends StatefulWidget {
  @override
  _AlteracaoPState createState() => _AlteracaoPState();
}

class _AlteracaoPState extends State<AlteracaoP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Center(
              child: Column(
            children: <Widget>[],
          )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          backgroundColor: Colors.greenAccent,
          child: Icon(Icons.arrow_back),
        ));
  }
}
