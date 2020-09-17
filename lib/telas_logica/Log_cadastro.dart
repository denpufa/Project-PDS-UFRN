import 'package:flutter/material.dart';
import 'package:projetodps/componentes/Alerta.dart';
import 'package:projetodps/servicos/Httptype.dart';

abstract class Log_cadastro {
  FutureBuilder submeter(nome, cpf, sus) {
    return FutureBuilder<Map>(
        future: Httptype.cadastrar_paciente(nome, cpf, sus),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              Alerta(
                  titulo: "Cadastro",
                  recado: "Houve um erro na conexão,tente novamente em breve");
              break;
            default:
              if (snapshot.hasError) {
                Alerta(
                  titulo: "Cadastro",
                  recado: "Houve um erro no cadastro,tente novamente em breve",
                );
              } else {
                Alerta(
                  titulo: "Cadastro",
                  recado: "Cadastro realizado com sucesso",
                );
              }
          }
        });
  }
}
