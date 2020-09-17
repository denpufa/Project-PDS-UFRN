import 'package:flutter/material.dart';
import 'package:projetodps/componentes/Botao.dart';
import 'package:projetodps/telas/AlteracaoP.dart';
import 'package:projetodps/telas/CadastroP.dart';
import 'package:projetodps/telas/DeleteP.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'SISMAC',
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
                padding: EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Botao(
                          texto: "Cadastrar paciente",
                          aoPressionar: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CadastroP()));
                          }),
                      Botao(
                          texto: "Deletar paciente",
                          aoPressionar: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DeleteP()));
                          }),
                      Botao(
                          texto: "Alterar paciente",
                          aoPressionar: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AlteracaoP()));
                          }),
                      Botao(
                          texto: "Buscar paciente",
                          aoPressionar: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BuscaP()));
                          }),
                      Botao(
                          texto: "cadastrar especialidade",
                          aoPressionar: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CadastroE()));
                          }),
                    ]))),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(
          Icons.help_outline,
          color: Colors.black,
        ),
        backgroundColor: Colors.greenAccent,
      ),
    );
  }
}
