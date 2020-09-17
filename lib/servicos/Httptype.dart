import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

//endpoints para um sistema feito em spring
const String cadastrop = "http://localhost:8080/pacientes";
const String deletep = "http://localhost:8080/pacientes/deletarCadastro?";

abstract class Httptype {
  static Future<Map> cadastrar_paciente(
      dynamic n, dynamic cpf, dynamic c) async {
    http.Response reposta = await http.post(cadastrop, body: {
      "nome": n.text,
      "cpf": _passarCpfParaFormato(cpf.text),
      "carteiraSUS": c.text
    }, headers: {
      "Accepted": "application/json"
    });

    if (reposta.statusCode == 201) {
      return jsonDecode(reposta.body);
    } else {
      return null;
    }
  }

  static Future<bool> deleteP(String valor) async {
    if (valor.length == 11) {
      http.Response resposta = await http.delete(deletep + "cpf=" + valor);
      return _testeStatusCode(resposta);
    } else {
      http.Response resposta =
          await http.delete(deletep + "carteiraSUS=" + valor);
      return _testeStatusCode(resposta);
    }
  }

  //metódos auxilares para economia de código ou reajuste de valor da entrada pra ser enviado
  static bool _testeStatusCode(http.Response r) {
    if (r.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static String _passarCpfParaFormato(String cpf) {
    return cpf[0] +
        cpf[1] +
        cpf[2] +
        '.' +
        cpf[3] +
        cpf[4] +
        cpf[5] +
        '.' +
        cpf[6] +
        cpf[7] +
        cpf[8] +
        '-' +
        cpf[9] +
        cpf[10];
  }
}
