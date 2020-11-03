import 'package:flutter/material.dart';

class Alerta extends StatefulWidget {
  final String titulo;
  final String recado;

  Alerta({Key key, @required this.titulo, @required this.recado})
      : super(key: key);

  @override
  _AlertaState createState() => _AlertaState();
}

class _AlertaState extends State<Alerta> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.titulo),
      content: Text(widget.recado),
      contentTextStyle: TextStyle(color: Colors.black),
      backgroundColor: Colors.white,
      scrollable: true,
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("OK"))
      ],
    );
  }
}
