import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

//endpoints para API rest
const String paciente = "http://localhost:8080/pacientes";
const String deletep = "http://localhost:8080/pacientes/deletarCadastro?";

abstract class HttpTipo {
  static Future<Map> cadastrarPaciente(
      String nome,
      String cpf,
      String carteira,
      String cidade,
      String bairro,
      String complemento,
      String data,
      String telefone) async {
    http.Response resposta = await http.post(paciente, body: {
      "nome": nome,
      "cpf": cpf,
      "carteiraSUS": carteira,
      "cidade": cidade,
      "bairro": bairro,
      "complemento": complemento,
      "dataNascimento": data,
      "telefone": telefone
    }, headers: {
      "content-type": "application/json"
    });

    if (resposta.statusCode == 201) {
      return jsonDecode(resposta.body);
    } else {
      return null;
    }
  }

  static Future<Map> buscarPorSUS(String carteiraSUS) async {
    http.Response resposta = await http.get(
        paciente + "?carteiraSUS=" + carteiraSUS,
        headers: {"content-type": "application/json"});
    if (resposta.statusCode == 201) {
      return jsonDecode(resposta.body);
    } else {
      return null;
    }
  }
}
