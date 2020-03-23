import 'package:flutter/material.dart';
class Inputtoform extends StatefulWidget {
  final TextInputType _t;
  final String _r;
  final TextEditingController _c;
  final String _d;
  
  @override
  _InputtoformState createState() => _InputtoformState();

  Inputtoform(this._r,this._t,this._c,this._d);
  
  TextInputType getT(){return _t;}
  String getR(){return _r;}
  TextEditingController getC(){return _c;}
  String getD(){return _d;}
}
    

class _InputtoformState extends State<Inputtoform> {

String _validaremocao(String value)
{
      if(value.isNotEmpty)
      {
        if(value.length == 23 || value.length == 32)
            return "digite pelo menos um campo por favor";
      
         if(widget.getR() == "cpf"){
            if(value.length != 11)
                return "digite um cpf válido por favor";
        }else{
            if(value.length != 9)
                return "digite uma carteira do sus válida";
        }  
            
      
      }
}
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
               switch (widget.getD()) {
                 case 'c':
                    if(value.isEmpty){
                        return "insira " + widget.getR() +  " por favor!";
                    }else if(widget.getR() == "cpf"){
                      if(value.length != 11)
                        return "digite um cpf válido por favor";
                    }else if(widget.getR() == "carteira do sus"){
                          if(value.length != 9)
                             return "digite uma carteira do sus válida";
                      }
                      break;
                  case 'd':
                    if(value.isNotEmpty)
                    {
                      if(widget.getR() == "cpf"){
                          if(value.length != 11)
                            return "digite um cpf válido por favor";
                      }else{
                            if(value.length != 9)
                              return "digite uma carteira do sus válida";
                      }  
                    }
                    break;
                  } 
              }
        );
  }
}