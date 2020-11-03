import 'package:flutter/material.dart';
import 'package:projetodps/componentes/Botao.dart';
import 'package:projetodps/repositorios/ApiRepositorio.dart';

class PesquisaSus extends StatefulWidget {
  @override
  _PesquisaSusState createState() => _PesquisaSusState();
}

class _PesquisaSusState extends State<PesquisaSus> {
  var _carteiraControle = TextEditingController(text: "");
  final _key = GlobalKey<FormState>();
  bool _botaoPressionado = true;
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding:
                            EdgeInsets.only(top: 50, right: 20.0, left: 20.0),
                        decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.people,
                              color: Theme.of(context).primaryColor,
                            ),
                            Text(
                              "Digite sua carteira do sus",
                              style: TextStyle(color: Colors.blueGrey),
                            ),
                            Form(
                                key: _key,
                                child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      labelText: "sus",
                                      labelStyle: TextStyle(
                                          color: Colors.blueGrey[300],
                                          fontSize: 18),
                                    ),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                    controller: _carteiraControle,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "insira a carteira do sus por favor!";
                                      } else if (value.length != 9) {
                                        return "digite uma carteira do sus válida!";
                                      }
                                    }))
                          ],
                        ),
                      ),
                      Botao(
                          habilitar: _botaoPressionado,
                          texto: "Buscar",
                          aoPressionar: () {
                            setState(() {
                              _botaoPressionado = !_botaoPressionado;
                              if (_key.currentState.validate()) {
                                ApiRepositorio.buscarporsus(
                                    _carteiraControle.text, context);
                              }
                              _botaoPressionado = !_botaoPressionado;
                              _carteiraControle.text = "";
                            });
                          }),
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
