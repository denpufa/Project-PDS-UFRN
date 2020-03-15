import 'package:flutter/material.dart';
import 'package:projetodps/componentes/Button.dart';

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
            backgroundColor: Colors.redAccent,
            appBar: AppBar(
                 title: const Text('Sistema de marcações'),
                 centerTitle: true,
            ),
            body:Center(
              child:Padding(
                padding: EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
                child: Column(
                  children: <Widget>[
                    Button('Cadastrar Usuário',1,context),
                    SizedBox(height:25),
                    Button('Buscar Usuário',2,context),
                    SizedBox(height:25),
                    Button('Cadastrar Especialidade',3,context),
                  ]
                )
              )
            ),
            floatingActionButton: FloatingActionButton(onPressed:null,child:Icon(Icons.help_outline)),
          );
  }
}
