import 'package:projetodps/componentes/Button.dart';
import 'package:projetodps/servicos/Httptype.dart';
import 'package:flutter/material.dart';
import 'package:projetodps/componentes/Inputtoform.dart';

class CadastroP extends StatefulWidget {
  @override
  _CadastroPState createState() => _CadastroPState();
}

class _CadastroPState extends State<CadastroP> {
  //chave de acesso para acessar o formulario de cadastro ,usual em validaçÕes fora do próprio form por exemplo
  GlobalKey<FormState> _chave =  GlobalKey();
  
  // controladores ao texto digitado pelo usuário no 'inputtoform'
  TextEditingController cnome = TextEditingController(text: "insira o nome aqui");
  TextEditingController ccpf = TextEditingController(text: "insira o cpf aqui");
  TextEditingController csus = TextEditingController(text: "insira o número da carteira aqui");
  
   //metódo chamado para chamar o post e mostrar na tela um AlertDialog dependendo da resposta
   FutureBuilder _submeter() {
            return FutureBuilder<Map>(
              future: Httptype.postCP(cnome, ccpf, csus),
              builder: (context,snapshot){
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    AlertDialog(
                      title: Text("Cadastro"),
                      content: Text("Houve um erro de conexão"),
                      contentTextStyle: TextStyle(color:Colors.black),
                      backgroundColor: Colors.greenAccent,
                      actions: <Widget>[
                        Button("ok", 3)
                      ],

                    );
                    break;
                  default:
                    if(snapshot.hasError){
                      AlertDialog(
                        title: Text("Cadastro"),
                        content: Text("Houve erro no cadastro"),
                        contentTextStyle: TextStyle(color:Colors.black),
                        backgroundColor: Colors.greenAccent,
                        actions: <Widget>[
                          Button("ok", 3)
                        ],

                    );
                    }else{
                      AlertDialog(
                        title: Text("Cadastro"),
                        content: Text("Cadastro Realizado com sucesso"),
                        contentTextStyle: TextStyle(color:Colors.black),
                        backgroundColor: Colors.greenAccent,
                        actions: <Widget>[
                          Button("ok", 3)
                        ],
                        );
                    }
                }
              }  
            ); 
      }
   
   
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
                    Inputtoform("nome", TextInputType.text,cnome,'c'),
                    SizedBox(height: 12,),
                    Inputtoform("cpf", TextInputType.number,ccpf,'c'),
                    SizedBox(height: 12),
                    Inputtoform("carteira do sus",TextInputType.number,csus,'c'),
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
                      _submeter();                     
                      _resetarcampos();
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