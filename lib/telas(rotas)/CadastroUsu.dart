import 'package:flutter/material.dart';

class CadastroUsu extends StatefulWidget {
  @override
  _CadastroUsuState createState() => _CadastroUsuState();
}

class _CadastroUsuState extends State<CadastroUsu> {
  //chave de acesso para acessar o formulario de cadastro
  GlobalKey<FormState> _chave =  GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(
        child:Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Form(
              key: _chave,
              child: TextField()

            )
          ],
        )
      )
    );
  }
}