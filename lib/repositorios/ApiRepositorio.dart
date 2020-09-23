import 'package:flutter/material.dart';
import 'package:projetodps/componentes/Alerta.dart';
import 'package:projetodps/servicos/ApiServico.dart';

abstract class ApiRepositorio {
  static Map<String, String> paciente;

  static FutureBuilder buscarporsus(sus) {
    return FutureBuilder<Map>(
        future: HttpTipo.buscarPorSUS(sus),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              Alerta(
                  titulo: "Busca",
                  recado: "Houve um erro na conexão,tente novamente em breve");
              break;
            default:
              if (snapshot.hasError) {
                Alerta(
                  titulo: "Busca",
                  recado: "Houve um erro na busca,tente novamente em breve",
                );
              } else {
                if (snapshot.data == null) {
                  Navigator.pushNamed(context, '/cadastropaciente');
                } else {
                  paciente = snapshot.data;
                  Navigator.pushNamed(context, '/verificacao');
                }
              }
          }
        });
  }

  static FutureBuilder cadastrar_paciente(
      nome, cpf, carteira, cidade, bairro, complemento, data, telefone) {
    return FutureBuilder<Map>(
        future: HttpTipo.cadastrarPaciente(
            nome, cpf, carteira, cidade, bairro, complemento, data, telefone),
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
                if (snapshot.data == null) {
                  Alerta(
                    titulo: "Cadastro",
                    recado:
                        "Houve um erro no cadastro,tente novamente em breve",
                  );
                } else {
                  paciente = snapshot.data;
                  Navigator.pushNamed(context, '/usuario');
                }
              }
          }
        });
  }

  //metódos auxiliares
  String _passarCpfParaFormato(String cpf) {
    return cpf.substring(0, 3) +
        '.' +
        cpf.substring(3, 6) +
        '.' +
        cpf.substring(6, 9) +
        '-' +
        cpf.substring(9);
  }
}
