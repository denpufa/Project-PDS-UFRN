import 'package:flutter/material.dart';
class Inputtoform extends StatefulWidget {
  final TextInputType _t;
  final String _r;
  final TextEditingController _c;
  
  @override
  _InputtoformState createState() => _InputtoformState();

  Inputtoform(this._r,this._t,this._c);
  TextInputType getT(){return _t;}
  String getR(){return _r;}
  TextEditingController getC(){return _c;}
}
    

class _InputtoformState extends State<Inputtoform> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
              keyboardType: widget.getT(),
              decoration: InputDecoration(
                labelText: widget.getR(),
                labelStyle: TextStyle(color:Colors.black,fontSize: 18),
                ),
              onTap: () {widget.getC().text = "";},  
              textAlign: TextAlign.center,
              style: TextStyle(color:Colors.black,fontSize: 15),
              controller: widget.getC(),
              validator: (value){
                if(value.isEmpty){
                  return "insira " + widget.getR() +  " por favor!";
                }
                if(widget.getR() == "cpf"){
                  if(value.length != 11){
                    return "digite um cpf válido por favor";
                  }
                }
                if(widget.getR() == "carteira do sus"){
                  if(value.length != 15){
                    return "digite uma carteira do sus válida";
                  }
                }
                
              },
            );
  }
}