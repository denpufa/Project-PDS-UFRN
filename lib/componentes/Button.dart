import 'package:flutter/material.dart';
import 'package:projetodps/telas/CadastroP.dart';
class Button extends StatefulWidget {
  final String _t;
  final int _i;
  
  
  @override
  _Button createState() => _Button();
  Button(this._t,this._i,{Key key}):super(key:key);
  
  String getT(){return _t;}
  int getI(){return _i;}
  

}
 
 class _Button extends State<Button>{
  
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
          onPressed: (){_tipo(widget.getI());},
          textColor: Colors.black,
          padding: const EdgeInsets.all(0.0),
          child: Container(
            alignment: Alignment.center,
            width: 250,
            height: 40,
            color: Colors.greenAccent,
            padding: const EdgeInsets.all(10.0),
            child: Text(
            widget.getT(),
              style: TextStyle(fontSize: 18)
            ),
          ),
      
      );
  }
  
  void _tipo(int i)
  {
      switch(i)
      {
        case 1:Navigator.push(context,MaterialPageRoute(builder:(context) =>  CadastroP()));  break;
        case 2: break;
        case 3: break;
        break;
      }
    }
 } 