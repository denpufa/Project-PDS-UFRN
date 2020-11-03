import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'constantes.dart';

abstract class ApiServico {
  static Future atualizarUsuario(
      String nome, String email, String senha) async {
    http.Response resposta = await http.put(usuario,
        headers: {"content-type": "application/json"},
        body: json
            .encode({"nome": nome, "email": email, "senha": senha, "role": 1}));

    if (resposta.statusCode >= 200 && resposta.statusCode <= 300) {
      return jsonDecode(resposta.body);
    } else {
      return null;
    }
  }

  static Future colocarNaFilaConsulta(
      int paciente_id, int usuario_id, int especialidade_id) async {
    http.Response resposta = await http.post(filaDeEsperaConsulta,
        headers: {'content-type': 'application/json'},
        body: jsonEncode({
          "paciente_id": paciente_id,
          "user_id": usuario_id,
          "especialidade_id": especialidade_id
        }));
    if (resposta.statusCode >= 200 && resposta.statusCode <= 300) {
      return jsonDecode(resposta.body);
    } else {
      return null;
    }
  }

  static Future buscarAgendamentos() async {
    http.Response resposta = await http
        .get(buscarAgendamentos, headers: {'content-type': 'application/json'});
    if (resposta.statusCode >= 200 && resposta.statusCode <= 300) {
      return jsonDecode(resposta.body);
    } else {
      return null;
    }
  }

  static Future usuarioAuth(String email, String senha) async {
    http.Response resposta = await http.post(login,
        headers: {'content-type': 'application/json'},
        body: jsonEncode({'username': email, 'senha': senha}));

    if (resposta.statusCode >= 200 && resposta.statusCode <= 300) {
      return jsonDecode(resposta.body);
    } else {
      return null;
    }
  }

  static Future vincularUsuarioPaciente(int id, String cpf) async {
    http.Response resposta = await http.put(
        vinculoUsuarioPaciente + "/$id?cpf=$cpf",
        headers: {'content-type': 'application/json'});
    if (!(resposta.statusCode >= 200 && resposta.statusCode <= 300)) {
      throw http.ClientException("solicitação não foi concluida");
    }
  }

  static Future cadastrarPaciente(
      String nome,
      String cpf,
      String carteira,
      String cidade,
      String bairro,
      String complemento,
      String data,
      String telefone,
      String numero) async {
    http.Response resposta = await http.post(paciente,
        headers: {"content-type": "application/json"},
        body: json.encode({
          "nome": nome,
          "cpf": cpf,
          "carteiraSUS": carteira,
          "cidade": cidade,
          "bairro": bairro,
          "complemento": complemento,
          "dataNascimento": data,
          "telefone": telefone,
          "numero": numero
        }));

    if (resposta.statusCode >= 200 && resposta.statusCode <= 300) {
      return jsonDecode(resposta.body);
    } else {
      return null;
    }
  }

  static Future buscarPorSUS(String carteiraSUS) async {
    http.Response resposta = await http.get(
        paciente + "?carteiraSUS=" + carteiraSUS,
        headers: {"content-type": "application/json"});

    if (resposta.statusCode >= 200 && resposta.statusCode <= 300) {
      return jsonDecode(resposta.body);
    } else {
      return null;
    }
  }

  static Future cadastrarUsuario(
      String nome, String email, String senha) async {
    print(
        json.encode({"nome": nome, "email": email, "senha": senha, "role": 1}));

    http.Response resposta = await http.post(usuario,
        headers: {"content-type": "application/json"},
        body: json
            .encode({"nome": nome, "email": email, "senha": senha, "role": 1}));

    print(resposta.statusCode);
    if (resposta.statusCode >= 200 && resposta.statusCode <= 300) {
      print(resposta.body);
      return jsonDecode(resposta.body);
    } else {
      print(resposta.body);
      return null;
    }
  }

  static Future<Map> atualizar_paciente(
      String nome,
      String cpf,
      String carteira,
      String cidade,
      String bairro,
      String complemento,
      String data,
      String telefone,
      String numero) async {
    http.Response resposta = await http.put(atualizarPaciente,
        headers: {"content-type": "application/json"},
        body: json.encode({
          "nome": nome,
          "cpf": cpf,
          "carteiraSUS": carteira,
          "cidade": cidade,
          "bairro": bairro,
          "complemento": complemento,
          "dataNascimento": data,
          "telefone": telefone,
          "numero": numero
        }));
    if (resposta.statusCode >= 200 && resposta.statusCode <= 300) {
      return jsonDecode(resposta.body);
    } else {
      return null;
    }
  }

  static Future<Map> validar(String token, int id) async {
    http.Response resposta = await http.post(validacao + '/' + '$id',
        headers: {"content-type": "application/json"},
        body: json.encode({"token": token}));
    if (resposta.statusCode >= 200 && resposta.statusCode <= 300) {
      return jsonDecode(resposta.body);
    } else {
      return null;
    }
  }
}
