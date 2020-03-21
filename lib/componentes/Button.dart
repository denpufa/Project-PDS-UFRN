import 'package:flutter/material.dart';
import 'package:projetodps/telas/CadastroP.dart';
class Button extends StatelessWidget {
  final String _t;
  final int _i;
  

  Button(this._t,this._i);
  
  String getT(){return _t;}
  int getI(){return _i;}
  
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
          onPressed: (){_tipo(getI(),context);},
          textColor: Colors.black,
          padding: const EdgeInsets.all(0.0),
          child: Container(
            alignment: Alignment.center,
            width: 250,
            height: 40,
            color: Colors.greenAccent,
            padding: const EdgeInsets.all(10.0),
            child: Text(
            getT(),
              style: TextStyle(fontSize: 18)
            ),
          ),
      
      );
  }
  
  void _tipo(int i,BuildContext c)
  {
      
      switch(i)
      {
        case 1:Navigator.push(c,MaterialPageRoute(builder:(context) =>  CadastroP()));  break;
        case 2: break;
        case 3:Navigator.pop(c); break;
        break;
      }
    }
 } 