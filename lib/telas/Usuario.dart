import 'package:flutter/material.dart';
import 'package:projetodps/componentes/Botao.dart';
import 'package:projetodps/repositorios/ApiRepositorio.dart';

class Usuario extends StatefulWidget {
  @override
  _UsuarioState createState() => _UsuarioState();
}

class _UsuarioState extends State<Usuario> {
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
                "SAIR",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => Navigator.pushNamed(context, '/'),
            )
          ],
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
            padding: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Botao(
                      habilitar: true,
                      texto: "Agendamentos",
                      aoPressionar: () =>
                          Navigator.pushNamed(context, '/agendamentos')),
                  SizedBox(
                    height: 10,
                  ),
                  Botao(
                    cor: Colors.white,
                    corTexto: Theme.of(context).primaryColor,
                    habilitar: true,
                    texto: "Alterações",
                    aoPressionar: () {},
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Botao(
                      habilitar: true,
                      texto: "Acompanhamentos",
                      aoPressionar: null),
                  Padding(
                    padding: EdgeInsets.only(bottom: 7, top: 10),
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.person),
                            title:
                                Text(ApiRepositorio.paciente["nomePaciente"]),
                            subtitle: Text("nome"),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 7),
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.credit_card),
                            title: Text(ApiRepositorio.paciente["cpf"]),
                            subtitle: Text("cpf"),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(bottom: 7),
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.credit_card),
                              title:
                                  Text(ApiRepositorio.paciente["carteiraSUS"]),
                              subtitle: Text("carteira do SUS"),
                            )
                          ],
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(bottom: 7),
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.location_city),
                              title: Text(ApiRepositorio.paciente["cidade"]),
                              subtitle: Text("cidade"),
                            )
                          ],
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(bottom: 7),
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                              leading: Icon(Icons.edit_location),
                              title: Text(ApiRepositorio.paciente["bairro"]),
                              subtitle: Text('bairro') //Text("bairro"),
                              )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(bottom: 7),
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                                leading: Icon(Icons.location_on),
                                title: Text(ApiRepositorio.paciente["numero"]),
                                subtitle: Text('nº'))
                          ],
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(bottom: 7),
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                                leading: Icon(Icons.edit_location),
                                title: Text(
                                    ApiRepositorio.paciente["complemento"]),
                                subtitle: Text('complemento'))
                          ],
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(bottom: 7),
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.date_range),
                              title: Text(
                                  ApiRepositorio.paciente["dataNascimento"]),
                              subtitle: Text("data de nascimento"),
                            )
                          ],
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(bottom: 7),
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.phone),
                            title: Text(ApiRepositorio.paciente["telefone"]),
                            subtitle: Text("telefone"),
                          )
                        ],
                      ),
                    ),
                  ),
                ])));
  }
}
