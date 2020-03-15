import 'package:flutter/material.dart';
import 'package:projetodps/telas/CadastroUsu.dart';
class Button extends StatefulWidget {
  final String t;
  final int i;
  final BuildContext c;
  
  @override
  _Button createState() => _Button();
  Button(this.t,this.i,this.c,{Key key}):super(key:key);
  
  String getT(){return t;}
  int getI(){return i;}
  BuildContext getC(){return c;}

}
 
 class _Button extends State<Button>{
  
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
         onPressed: (){_tipo(widget.getI());}
        ,
        textColor: Colors.white,
        padding: const EdgeInsets.all(0.0),
        child: Container(
          height: 47,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xFF0D47A1),
                Color(0xFF1976D2),
                Color(0xFF42A5F5),
              ],
            ),
          ),
          padding: const EdgeInsets.all(10.0),
          child: Text(
          widget.getT(),
            style: TextStyle(fontSize: 20)
          ),
        ),
      );
  }

  void _cadastro(){Navigator.push(context,MaterialPageRoute(builder:(context) =>  CadastroUsu()));}
  
  void _busca(){}
  
  void _cadastroEsp(){}
  
  void _tipo(int i){
      switch(i){
                case 1: _cadastro(); break;
                case 2:_busca(); break;
                case 3:_cadastroEsp(); break;
                break;
        }
    }
 } 