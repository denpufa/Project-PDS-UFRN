import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistema de marcações',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
        title: TextStyle(color: Colors.black12)

        )
      ),
      home: MyHomePage(title: 'Pagina incial'),
      
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
      appBar: AppBar(
        actions: <Widget>[
          FlatButton(onPressed: null, child: Text("Ajuda"))
        ],
        title: Text(widget.title,),
      ),
      body: Center(
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0,0.0),
              child: RaisedButton(onPressed:null ,
              color: Colors.blueAccent,
              child: Text("Cadastrar Usuário"),
            
              
              ),
              ),
              SizedBox(width: 10,),
              RaisedButton(onPressed: null,
              color: Colors.blueAccent,
              child: Text("Buscar Usuário"),
              ),
              SizedBox(width: 10,),
              RaisedButton(onPressed: null,
              color: Colors.blueAccent,
              child: Text("Cadastrar Especialidade"),
              ),


          ],
        ),
      ),
      
    );
  }
}
