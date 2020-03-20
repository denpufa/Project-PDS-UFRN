import 'package:flutter/material.dart';
import 'package:projetodps/componentes/Inputtoform.dart';

class CadastroP extends StatefulWidget {
  @override
  _CadastroPState createState() => _CadastroPState();
}

class _CadastroPState extends State<CadastroP> {
  //chave de acesso para acessar o formulario de cadastro usar em validaçÕes fora do próprio form por exemplo
  GlobalKey<FormState> _chave =  GlobalKey();
  
  // controladores ao texto digitado pelo usuário no 'inputtoform'
  TextEditingController cnome = TextEditingController(text: "insira o nome aqui");
  TextEditingController ccpf = TextEditingController(text: "insira o cpf aqui");
  TextEditingController csus = TextEditingController(text: "insira o número da carteira aqui");
  
   


  void _resetarcampos() {
    cnome.text = "insira o nome aqui";
    ccpf.text = "insira o cpf aqui";
    csus.text = "insira o número da carteira aqui";
      
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 150.0, 10.0, 0.0),
          child:Center(
          child:Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Form(
                key: _chave,
                child: Column(
                  children: <Widget>[
                    Inputtoform("nome", TextInputType.text,cnome),
                    SizedBox(height: 12,),
                    Inputtoform("cpf", TextInputType.number,ccpf),
                    SizedBox(height: 12),
                    Inputtoform("carteira do sus",TextInputType.number,csus),
                    SizedBox(height:12),
                  ],
                )
              ),
            SizedBox(height: 25,),
            Container(
              width: 300,
              child: RaisedButton(
                color: Colors.greenAccent,
                onPressed:() {
                  if(_chave.currentState.validate()){
                      _resetarcampos();
                      debugPrint("deu certo");
                    }
                },
                child: Text("cadastrar",style: TextStyle(color:Colors.black,fontSize:20),),
                
                ),
            )  
            ],
          )
       )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() {Navigator.pop(context);},
        child: Icon(Icons.arrow_back,color: Colors.black,),
        backgroundColor: Colors.greenAccent,
      ),
    
  );
    
  }
}