import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projetodps/componentes/Alerta.dart';
import 'package:projetodps/servicos/ApiServico.dart';

abstract class ApiRepositorio {
  static dynamic paciente;
  static dynamic usuario;
  static dynamic agendamentos;

  static Future colocarNaFilaConsulta(
      int especialidade_id, BuildContext context) async {
    var resposta = await ApiServico.colocarNaFilaConsulta(
        paciente['id'], usuario['id'], especialidade_id);
    if (resposta == null) {
      showDialog(
          context: context,
          child: Alerta(
            titulo: 'erro',
            recado: 'erro,tente novamnete',
          ));
    } else {
      showDialog(
          context: context,
          child: Alerta(
              titulo: 'sucesso',
              recado:
                  'quando sua consulta for marcada voce recebera por email'));
    }

    showDialog(
        context: context,
        child: Alerta(
            titulo: "Sucesso",
            recado:
                "Voçê receberar por e-mail quando sua consulta for marcada!"));
  }

  static Future alterar_usuario(
      String nome, String email, String senha, BuildContext context) async {
    nome = nome.isNotEmpty ? nome : usuario['username'];
    email = email.isNotEmpty ? email : usuario['email'];
    senha = senha.isNotEmpty ? senha : usuario['senha'];

    var resposta = await ApiServico.atualizarUsuario(nome, email, senha);
    if (resposta == null) {
      showDialog(
          context: context,
          child: Alerta(
              titulo: 'Erro', recado: 'erro na solisitação,tente novamnete!'));
    } else {
      showDialog(
          context: context,
          child: Alerta(titulo: 'Sucesso', recado: 'usuário modificado!'));
    }
  }

  static Future buscarAgendamentos(BuildContext context) async {
    try {
      var resposta = await ApiServico.buscarAgendamentos();
      if (resposta == null) {
        showDialog(
            context: context,
            child: Alerta(
              titulo: 'erro',
              recado: 'Algo deu errado!',
            ));
      } else {
        return List.from(resposta);
      }
    } catch (e) {
      showDialog(
          context: context,
          child: Alerta(titulo: 'erro', recado: 'algo deu errado!'));
    }
  }

  static alterar_paciente(
      String nome,
      String cpf,
      String carteiraSUS,
      String cidade,
      String bairro,
      String complemento,
      String data,
      String telefone,
      String numero,
      context) async {
    try {
      nome = nome.isNotEmpty ? nome : paciente['nomePaciente'];
      cpf = cpf.isNotEmpty ? cpf : paciente['cpf'];
      telefone = telefone.isNotEmpty ? telefone : paciente['telefone'];
      data = data.isNotEmpty ? data : paciente['dataNascimento'];
      complemento =
          complemento.isNotEmpty ? complemento : paciente['complemento'];
      bairro = bairro.isNotEmpty ? bairro : paciente['bairro'];
      carteiraSUS =
          carteiraSUS.isNotEmpty ? carteiraSUS : paciente['carteiraSUS'];
      cidade = cidade.isNotEmpty ? cidade : paciente['cidade'];
      numero = numero.isNotEmpty ? numero : paciente['numero'];
      var resposta = await ApiServico.atualizar_paciente(
          nome,
          _passarCpfParaFormato(cpf),
          carteiraSUS,
          cidade,
          bairro,
          complemento,
          data,
          telefone,
          numero);
      if (resposta == null) {
        showDialog(
            context: context,
            child: Alerta(
                titulo: 'erro na solitação',
                recado: 'desculpe a solitação não foi concluida!'));
      } else {
        await showDialog(
            context: context,
            child: Alerta(titulo: 'Sucesso', recado: 'paciente atualizado!'));
        paciente = resposta;
      }
    } catch (e) {
      showDialog(
          context: context,
          child: Alerta(
            titulo: "Erro!",
            recado: "erro ao conectar ao servidor,tente novamente",
          ));
    }
  }

  static entrar_usuario(
      String username, String senha, BuildContext context) async {
    try {
      var resposta = await ApiServico.usuarioAuth(username, senha);
      if (resposta == null) {
        showDialog(
            context: context,
            child: Alerta(titulo: 'Erro', recado: 'usuário não encontrado!'));
      } else {
        usuario = resposta;
        Navigator.pushNamed(context, '/usuario');
      }
    } catch (e) {
      showDialog(
          context: context,
          child: Alerta(titulo: 'Erro', recado: 'problema na conexão!'));
    }
  }

  static validacao(String token, int id, BuildContext context) async {
    try {
      var resposta = await ApiServico.validar(token, id);
      if (resposta == null) {
        showDialog(
            context: context,
            child: Alerta(titulo: 'erro', recado: 'Token inválido!'));
      } else {
        await showDialog(
            context: context,
            child: Alerta(titulo: 'sucesso', recado: 'Token validado!'));
        Navigator.pushNamed(context, '/usuario');
      }
    } catch (e) {
      showDialog(
          context: context,
          child: Alerta(
              titulo: 'erro', recado: 'A solicitação não foi concluida!'));
    }
  }

  static buscarporsus(sus, context) async {
    try {
      var resposta = await ApiServico.buscarPorSUS(sus);
      if (resposta == null) {
        await showDialog(
            context: context,
            child: Alerta(
                titulo: 'sucesso',
                recado: 'Paciente não cadastrado no sistema,se cadastre!'));
        Navigator.pushNamed(context, '/cadastropaciente');
      } else {
        paciente = resposta['content'];
        await showDialog(
            context: context,
            child: Alerta(
                titulo: 'sucesso',
                recado: 'Paciente  cadastrado no sistema,crie um usuário!'));
        Navigator.pushNamed(context, '/cadastrousuario');
      }
    } catch (e) {
      showDialog(
          context: context,
          child: Alerta(
              titulo: 'erro',
              recado: 'desculpe a solitação não foi concluida!'));
    }
  }

  static cadastrar_paciente(nome, cpf, carteira, cidade, bairro, complemento,
      data, telefone, numero, context) async {
    try {
      var resposta = await ApiServico.cadastrarPaciente(
          nome,
          _passarCpfParaFormato(cpf),
          carteira,
          cidade,
          bairro,
          complemento,
          data,
          telefone,
          numero);
      if (resposta == null) {
        showDialog(
            context: context,
            child: Alerta(
                titulo: 'erro na solitação',
                recado: 'desculpe a solitação não foi concluida!'));
      } else {
        await showDialog(
            context: context,
            child: Alerta(
                titulo: 'Paciente registrado com sucesso',
                recado: 'agora crie seu usuário'));
        paciente = resposta;
        Navigator.pushNamed(context, '/cadastrousuario');
      }
    } catch (e) {
      showDialog(
          context: context,
          child: Alerta(
            titulo: "Erro!",
            recado: "erro ao conectar ao servidor,tente novamente",
          ));
    }
  }

  static cadastrar_usuario(
      String nome, String email, String senha, BuildContext context) async {
    try {
      var resposta = await ApiServico.cadastrarUsuario(nome, email, senha);

      if (resposta == null) {
        showDialog(
            context: context,
            child: Alerta(
                titulo: 'Erro',
                recado: 'Erro no cadastro do usuário,tente novamente!'));
      } else {
        usuario = resposta;
        await ApiServico.vincularUsuarioPaciente(
            usuario['id'], paciente['cpf']);

        await showDialog(
            context: context,
            child: Alerta(
                titulo: 'Sucesso',
                recado:
                    'cadastro com sucesso e vinculado o paciente cadastrado,agora verifique seu usuário!'));

        Navigator.pushNamed(context, '/verificacao');
      }
    } catch (e) {
      showDialog(
          context: context,
          child: Alerta(
              titulo: 'erro',
              recado: 'Solicitação nao foi concluida,tente novamente!'));
    }
  }

  //metódos auxiliares
  static String _passarCpfParaFormato(String cpf) {
    return cpf.substring(0, 3) +
        '.' +
        cpf.substring(3, 6) +
        '.' +
        cpf.substring(6, 9) +
        '-' +
        cpf.substring(9);
  }
}
