import 'package:flutter/material.dart';
import 'package:projetodps/componentes/Botao.dart';
import 'package:projetodps/repositorios/ApiRepositorio.dart';

class Agendamentos extends StatefulWidget {
  @override
  _AgendamentosState createState() => _AgendamentosState();
}

class _AgendamentosState extends State<Agendamentos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 0.0),
        child: Column(
          children: <Widget>[
            Text("Escolha uma especialidade para consulta ou  um exame",
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 16)),
            FutureBuilder<List>(
                future: ApiRepositorio.buscarAgendamentos(context),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return LinearProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.blue[200]),
                        backgroundColor: Colors.white,
                      );
                      break;
                    default:
                      return ListView.builder(
                          itemCount: snapshot.data.length - 1,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding:
                                  EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 15.0),
                              child: Botao(
                                  texto: snapshot.data[i]["nomeEspecialidade"],
                                  aoPressionar: () =>
                                      ApiRepositorio.colocarNaFilaConsulta(
                                          snapshot.data[i]['id'], context)),
                            );
                          });
                  }
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        elevation: 0,
        child: Icon(
          Icons.arrow_back,
          color: Theme.of(context).primaryColor,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
