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
            backgroundColor: Colors.white,
            appBar: AppBar(
                 title: const Text('SISMAC',style: TextStyle(color:Colors.black,fontSize: 25),),
                 centerTitle: true,
                 backgroundColor: Colors.greenAccent,
            ),
            body:SingleChildScrollView(
              child: Center(
                  child:Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
                    child: Column(
                      children: <Widget>[
                        Button('Cadastrar Paciente',1),
                        SizedBox(height:25),
                        Button('deletar Paciente', 2),
                        SizedBox(height: 25),
                        Button('Alterar Paciente',4),
                        SizedBox(height:25),
                        Button('Buscar Paciente',5),
                        SizedBox(height:25),
                        Button('Cadastrar Especialidade',4),
                        SizedBox(height:25),
                      ]
                    )
                  )
                ),
            ),
            floatingActionButton: FloatingActionButton(onPressed:null,child:Icon(Icons.help_outline,color: Colors.black,),backgroundColor: Colors.greenAccent,),
          );
  }
}
