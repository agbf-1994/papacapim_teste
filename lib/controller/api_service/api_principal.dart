import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/sessao.dart';
import '../../model/usuario.dart';

class ApiPrincipal 
{
  Future<List<UsuarioConta>> buscarUsuarios() async
  {
    final http.Client cliente = http.Client();

    try
    {
      http.Response? resp = await cliente.get
      (
        Uri.parse('https://api.papacapim.just.pro.br/users'),
      );
      List<dynamic> data = json.decode(resp.body);

      switch (resp.statusCode)
      {
        case 200:
          return data.map((json) => UsuarioConta.fromJson(json)).toList();
        case 401:
          throw Exception("Usuário e/ou senha inválidos.");
        case 404:
          throw Exception("Não foi possível acessar a sua conta.\nTente novamente mais tarde.");
        case 408:
          throw Exception("Tempo esgotado.\nPode haver um problema de conexão de rede.");
        case 500:
          throw Exception("Erro interno do servidor.");
        case 503:
          throw Exception("O serviço está indisponível. \nTente novamente mais tarde.");
        default:
          throw Exception(resp.reasonPhrase);
      }

    }
    on Exception catch(_)
    {
      rethrow;

    }
  }

  Future<UsuarioConta> novoUsuario(Usuario usr) async
  {
    http.Client cliente = http.Client();
    var body = json.encode(usr.toJson());

    try
    {
      http.Response? resp = await cliente.post
      (
        Uri.parse('https://api.papacapim.just.pro.br/users'),
        headers: {'Content-Type': 'application/json'},
        
        body: body,
        
      );

      switch(resp.statusCode)
      {
        case 201:
          return UsuarioConta.fromJson(json.decode(resp.body));
        default:
          throw Exception(resp.reasonPhrase);

      }   
    }
    on Exception catch(_)
    {
      rethrow;
    }
  }

  Future<Sessao> novaSessao(SessaoAtivado su) async
  {
    http.Client cliente = http.Client();
    var body = json.encode(su.toJson());

    try
    {
      http.Response? resp = await cliente.post
      (
        Uri.parse('https://api.papacapim.just.pro.br/sessions'),
        headers: {'Content-Type': 'application/json'},
        body: body  
      );
      switch (resp.statusCode)
      {
        case 200:
          return Sessao.fromJson(json.decode(resp.body));
        case 401:
          throw Exception("Usuário e/ou senha inválidos.");
        case 404:
          throw Exception("Não foi possível acessar a sua conta.\nTente novamente mais tarde.");
        case 408:
          throw Exception("Tempo esgotado.\nPode haver um problema de conexão de rede.");
        case 500:
          throw Exception("Erro interno do servidor.");
        case 503:
          throw Exception("O serviço está indisponível. \nTente novamente mais tarde.");
        default:
          throw Exception(resp.reasonPhrase);
      }

    }
    on Exception catch(_)
    {
      rethrow;

    }

  }
  

  Future<List<Sessao>> buscarSessoes() async
  {
    final http.Client cliente = http.Client();

      try
      {
        http.Response? resp = await cliente.get
        (
          Uri.parse('https://api.papacapim.just.pro.br/sessions'),
        );
        List<dynamic> data = json.decode(resp.body);

        switch(resp.statusCode)
        {
          case 200:
            return data.map((json) => Sessao.fromJson(json)).toList();
          default:
            throw Exception(resp.reasonPhrase);
        }        
      }
      on Exception catch(_)
      {
        rethrow;
      }
    }

  
    
}

