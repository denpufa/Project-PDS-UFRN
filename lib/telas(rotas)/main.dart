import 'package:flutter/material.dart';
import 'package:projetodps/button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistema de marcações',
      home: MyHomePage(title: 'home',),
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
            backgroundColor: Colors.white,
            body:Center(
              child:Padding(
                padding: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Sistema de marcações',style: TextStyle(color:Colors.blueAccent),),
                    Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0,0.0),
                    child: Button('Cadastrar Usuário',1,context) 
                    ),
                    SizedBox(width:10),
                    Button('Buscar Usuário',2,context),
                    SizedBox(width:10),
                    Button('Cadastrar Especialidade',3,context),
                  ]
                )
              )
            )
          );
  }
}
