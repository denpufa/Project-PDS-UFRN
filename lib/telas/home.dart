import 'package:flutter/material.dart';
import 'package:projetodps/componentes/Botao.dart';
import 'package:projetodps/repositorios/ApiRepositorio.dart';

class Home extends StatefulWidget {
  Home({
    Key key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _email = TextEditingController(text: "");
  var _senha = TextEditingController(text: "");
  final _key = GlobalKey<FormState>();
  bool _botaoPressionado = true;
  bool _verSenha = false;
  int aux = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'SISMAC',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor),
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
                padding: EdgeInsets.fromLTRB(15.0, 170.0, 15.0, 0.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding:
                            EdgeInsets.only(top: 40, right: 20.0, left: 20.0),
                        decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Form(
                                key: _key,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 10),
                                      child: TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            prefixIcon:
                                                Icon(Icons.alternate_email),
                                            border: OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(width: 1.2),
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                            ),
                                            labelText: "email",
                                            labelStyle: TextStyle(
                                                color: Colors.blueGrey[300],
                                                fontSize: 18),
                                          ),
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15),
                                          controller: _email,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return "insira seu email por favor!";
                                            } else if (!value.contains('@')) {
                                              return "digite um email válido!";
                                            }
                                          }),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 10),
                                      child: TextFormField(
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          obscureText: !_verSenha,
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(Icons.vpn_key),
                                            suffixIcon: IconButton(
                                                icon: _verSenha
                                                    ? Icon(Icons.visibility)
                                                    : Icon(
                                                        Icons.visibility_off),
                                                onPressed: () {
                                                  setState(() {
                                                    _verSenha = !_verSenha;
                                                  });
                                                }),
                                            border: OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(width: 1.2),
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                            ),
                                            labelText: "senha",
                                            labelStyle: TextStyle(
                                                color: Colors.blueGrey[300],
                                                fontSize: 18),
                                          ),
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15),
                                          controller: _senha,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return "insira sua senha por favor!";
                                            }
                                          }),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: Botao(
                            habilitar: _botaoPressionado,
                            texto: "Entrar",
                            aoPressionar: () {
                              setState(() {
                                _botaoPressionado = !_botaoPressionado;
                                if (_key.currentState.validate()) {
                                  ApiRepositorio.entrar_usuario(
                                      _email.text, _senha.text, context);
                                }
                                _botaoPressionado = !_botaoPressionado;
                              });
                            }),
                      ),
                      Botao(
                          habilitar: true,
                          cor: Colors.white,
                          corTexto: Theme.of(context).primaryColor,
                          texto: "Cadastrar",
                          aoPressionar: () {
                            setState(() {
                              Navigator.pushNamed(context, '/pesquisacpf');
                            });
                          }),
                      FlatButton(
                          onPressed: null, child: Text("esqueci a senha"))
                    ]))),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(
          Icons.help_outline,
          color: Theme.of(context).primaryColor,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }
}
