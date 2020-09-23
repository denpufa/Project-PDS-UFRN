import 'package:flutter/material.dart';
import 'package:projetodps/componentes/Botao.dart';
import 'package:projetodps/repositorios/ApiRepositorio.dart';

class VerificacaoU extends StatefulWidget {
  @override
  _VerificacaoUState createState() => _VerificacaoUState();
}

class _VerificacaoUState extends State<VerificacaoU> {
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
        Text("Confirme sua data de nascimento",
            style:
                TextStyle(color: Theme.of(context).primaryColor, fontSize: 19)),
        Padding(
            padding: EdgeInsets.fromLTRB(80.0, 20.0, 80.0, 0),
            child: Botao(
                habilitar: true,
                texto: "Confirmar",
                aoPressionar: () async {
                  DateTime data = await showDatePicker(
                    context: context,
                    initialDate: DateTime(1900),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );

                  if (data ==
                      DateTime.utc(
                          int.parse(ApiRepositorio.paciente['dataNascimento']
                              .substring(6)),
                          int.parse(ApiRepositorio.paciente['dataNascimento']
                              .substring(3, 5)),
                          int.parse(ApiRepositorio.paciente['dataNascimento']
                              .substring(0, 2)))) {
                    Navigator.pushNamed(context, '/usuario');
                  } else {
                    Navigator.pop(context);
                  }
                }))
      ]),
    );
  }
}
