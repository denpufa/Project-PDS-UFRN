import 'package:flutter/material.dart';
import 'package:projetodps/CadastroUsu.dart';
class Button extends StatefulWidget {
   @override
    _Button createState() => _Button();

  Button(String t,int i,BuildContext c){
    _Button createState() => _Button.com(t,i,c);
    }
  }
 class _Button extends State<Button>{
  String t;
  int i;
  BuildContext c;
  _Button();
  _Button.com(String t,int i,BuildContext c){
    this.t = t;
    this.i = i;
    this.c = c;
  }
  
  void cadastro(){
    MaterialPageRoute(builder:(c) =>  CadastroUsu());
  }
  void busca(){}
  void cadastroEsp(){}
  
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
         onPressed: (){
          switch(i){
           case 1:cadastro(); break;
           case 2:busca(); break;
           case 3:cadastroEsp(); break;
           break;
          }
        },
        textColor: Colors.white,
        padding: const EdgeInsets.all(0.0),
        child: Container(
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
            "$t",
            style: TextStyle(fontSize: 20)
          ),
        ),
        );
  }
}
 