import 'package:flutter/material.dart';
class Inputtoform extends StatefulWidget {
  final TextInputType _t;
  final String _r;
  
  @override
  _InputtoformState createState() => _InputtoformState();

  Inputtoform(this._r,this._t,);
  TextInputType getT(){return _t;}
  String getR(){return _r;}
}
    

class _InputtoformState extends State<Inputtoform> {
  TextEditingController controle;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
              keyboardType: widget.getT(),
              decoration: InputDecoration(
                labelText: widget.getR(),
                labelStyle: TextStyle(color:Colors.greenAccent),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color:Colors.greenAccent,fontSize: 20),
              controller: controle,
              validator: (value){
                if(value.isEmpty){
                  return "insira" + widget.getR() +  "por favor!";
                }
                
              },
            );
  }
}