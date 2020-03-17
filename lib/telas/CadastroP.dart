import 'package:flutter/material.dart';
import 'package:projetodps/componentes/Inputtoform.dart';

class CadastroP extends StatefulWidget {
  @override
  _CadastroPState createState() => _CadastroPState();
}

class _CadastroPState extends State<CadastroP> {
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
              child: Column(
                children: <Widget>[
                  Inputtoform("nome", TextInputType.text),
                  SizedBox(height: 12,),
                  Inputtoform("cpf", TextInputType.number),
                  SizedBox(height: 12),
                  Inputtoform("carteira do sus",TextInputType.number),
                  SizedBox(height:12),
                  
                ],
              )

            )
          ],
        )
      )
    );
  }
}