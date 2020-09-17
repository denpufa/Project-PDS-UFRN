import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Botao extends StatefulWidget {
  final String texto;
  final Color corTexto;
  final Color cor;
  final Function aoPressionar;
  final bool habilitar;
  final double largura;
  final Widget filho;

  Botao({
    Key key,
    @required this.texto,
    @required this.aoPressionar,
    this.habilitar,
    this.corTexto,
    this.largura,
    this.cor,
    this.filho,
  }) : super(key: key);

  @override
  _BotaoState createState() => _BotaoState();
}

class _BotaoState extends State<Botao> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        minWidth: widget.largura ?? MediaQuery.of(context).size.width,
        height: 50.0,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(
                  color: widget.habilitar
                      ? Theme.of(context).primaryColor
                      : Colors.transparent)),
          onPressed: widget.habilitar == true
              ? () {
                  widget.aoPressionar();
                }
              : null,
          highlightColor: Colors.orangeAccent,
          color: widget.cor ?? Theme.of(context).primaryColor,
          textColor: widget.corTexto ?? Colors.white,
          splashColor: widget.cor ?? Theme.of(context).primaryColor,
          disabledColor: Color.fromRGBO(255, 155, 2, 0.3),
          disabledTextColor: Colors.white,
          child: widget.filho ?? Text(widget.texto),
        ));
  }
}
