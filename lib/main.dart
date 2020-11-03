import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:projetodps/telas/Agendamentos.dart';
import 'package:projetodps/telas/Alteracao.dart';
import 'package:projetodps/telas/AlteracaoP.dart';
import 'package:projetodps/telas/AlteracaoU.dart';
import 'package:projetodps/telas/CadastroP.dart';
import 'package:projetodps/telas/CadastroU.dart';
import 'package:projetodps/telas/PesquisaSus.dart';
import 'package:projetodps/telas/Usuario.dart';
import 'package:projetodps/telas/VerificacaoU.dart';

import 'telas/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sistema de marcações',
      initialRoute: '/',
      localizationsDelegates: [GlobalMaterialLocalizations.delegate],
      supportedLocales: [const Locale('pt')],
      theme: ThemeData(
          primaryColor: Color(0xFF103a53),
          backgroundColor: Colors.grey[300],
          primarySwatch: Colors.blueGrey),
      routes: {
        '/': (context) => Home(),
        '/cadastropaciente': (context) => CadastroP(),
        '/usuario': (context) => Usuario(),
        '/verificacao': (context) => VerificacaoU(),
        '/pesquisacpf': (context) => PesquisaSus(),
        '/cadastrousuario': (context) => CadastroU(),
        '/alteracao': (context) => Alteracao(),
        '/alteracaopaciente': (context) => AlteracaoP(),
        '/agendamentos': (context) => Agendamentos(),
        '/alteracaousuario': (context) => AlteracaoU(),
      },
    );
  }
}
