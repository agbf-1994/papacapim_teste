import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../model/post.dart';
import '../../model/sessao.dart';
import '../../model/usuario.dart';
import '../ger_token_sessao.dart';

class ApiAcesso 
{
  Future<List<UsuarioConta>> listarUsuarios(int? p, String? s) async
  {

    final token = await getToken();

    if(token!=null)
    {
      String url = "";
      if((p==null) && (s==null))
      {
        url = 'https://api.papacapim.just.pro.br/users';
      }
      else if(p==null)
      {
        url = 'https://api.papacapim.just.pro.br/users?search=$s';
      }
      else if(s==null)
      {
        url = 'https://api.papacapim.just.pro.br/users?page=$p';
      }
      else
      {
        url = 'https://api.papacapim.just.pro.br/users?page=$p&search=$s';
      }

      final http.Client cliente = http.Client();
      try
      {
        http.Response? resp = await cliente.get
        (
          Uri.parse(url),
          headers: {'X-Session-Token': token, 'Content-Type': 'application/json',}
          
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
    else
    {
      throw Exception("Erro de autenticação!");
    }
    
     
  }

  Future<List<UsuarioConta>> buscarUsuario(String usr) async
  {

    final token = await getToken();

    if(token!=null)
    {
      final http.Client cliente = http.Client();
      try
      {
        http.Response? resp = await cliente.get
        (
          Uri.parse('https://api.papacapim.just.pro.br/users?search=$usr'),
          headers: {'X-Session-Token': token, 'Content-Type': 'application/json',}
          
        );
        
        List<dynamic> usuariosBuscados = json.decode(resp.body);
        
        switch (resp.statusCode)
        {
          case 200:
            return usuariosBuscados.map((json) => UsuarioConta.fromJson(json)).toList();
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
    
    else
    {
      throw Exception("Erro de autenticação!");
    }
     
  }

  
  Future<UsuarioConta> getUsuario() async
  {
    final token = await getToken();
    final us = await getUsername();
    if(token!=null)
    {

      final http.Client cliente = http.Client();
      try
      {
        http.Response? resp = await cliente.get
        (
          Uri.parse('https://api.papacapim.just.pro.br/users/$us/'),
          headers: {'X-Session-Token': token, 'Content-Type': 'application/json',}
          
        );

        switch (resp.statusCode)
        {
          case 200:
            return UsuarioConta.fromJson(json.decode(resp.body));
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
    else
    {
      throw Exception("Erro de autenticação!");
    }
  }
  

  Future<UsuarioConta> alterarUsuario(Usuario n) async
  {

    final token = await getToken();

    if(token!=null)
    {
      var usuario = json.encode(n.toJson());

      final http.Client cliente = http.Client();
      try
      {
        http.Response? resp = await cliente.patch
        (
          Uri.parse('https://api.papacapim.just.pro.br/users/1'),
          headers: {'X-Session-Token': token, 'Content-Type': 'application/json',},
          body: usuario,
          
        );
        switch (resp.statusCode)
        {
          case 201:
            return UsuarioConta.fromJson(json.decode(resp.body));
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
    
    else
    {
      throw Exception("Erro de autenticação!");
    }
     
  }

  Future<Seguidor> seguirUsuario(String sg) async
  {
    final token = await getToken();
    if (token != null) 
    {
      final http.Client cliente = http.Client();
      try
        {
          http.Response? resp = await cliente.post
          (
            Uri.parse('https://api.papacapim.just.pro.br/users/$sg/followers'),
            headers: {'X-Session-Token': token, 'Content-Type': 'application/json'},
          
          );
        switch (resp.statusCode)
        {
          case 201:
            return Seguidor.fromJson(json.decode(resp.body));
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
    else
    {
      throw Exception("Erro de autenticação!");

    }

  }

  Future<List<Seguidor>> listarSeguidores(String sg) async
  {
    final token = await getToken();
    if (token != null) 
    {
      final http.Client cliente = http.Client();
      try
        {
          http.Response? resp = await cliente.get
          (
            Uri.parse('https://api.papacapim.just.pro.br/users/$sg/followers'),
            headers: {'X-Session-Token': token, 'Content-Type': 'application/json'},
          
          );

          List<dynamic> seguidores = json.decode(resp.body);
            
          switch (resp.statusCode)
        {
          case 200:
            return seguidores.map((json) => Seguidor.fromJson(json)).toList();
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
    else
    {
      throw Exception("Erro de autenticação!");

    }

  }

  Future<void> apagarSeguidor(int st, String sn) async
  {
    final token = await getToken();
    if(token!=null)
    {
      final http.Client cliente = http.Client();

        try
        {
          http.Response? resp = await cliente.delete
          (
            Uri.parse
            ('https://api.papacapim.just.pro.br/users/$sn/followers/$st'),
            headers: 
            {
              'X-Session-Token': token,
              'Content-Type': 'application/json',
            },
          );
        switch (resp.statusCode)
        {
          
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
    else
    {
      throw Exception("Erro de autenticação!");
    }
    

  }
        

  Future<List<Post>> listarPosts(String? s, int? p, int? f) async 
  {
    final token = await getToken();
    if (token != null) 
    {
      String url = "";
      if((s==null) && (p==null) && (f==null))
      {
        url = 'https://api.papacapim.just.pro.br/posts';
      }
      else if((s==null) && (p==null))
      {
        url = 'https://api.papacapim.just.pro.br/posts?feed=$f';
      }
      else if((s==null) && (f==null))
      {
        url = 'https://api.papacapim.just.pro.br/posts?page=$p';
      }
      else if((p==null) && (f==null))
      {
        url = 'https://api.papacapim.just.pro.br/posts?search=$s';
      }
      else if(s==null)
      {
        url = 'https://api.papacapim.just.pro.br/posts?page=$p&feed=$f';
      }
      else if(p==null)
      {
        url = 'https://api.papacapim.just.pro.br/posts?search=$s&feed=$f';
      }
      else if(f==null)
      {
        url = 'https://api.papacapim.just.pro.br/posts?search=$s&page=$p';
      }
      else  
      {
        url = 'https://api.papacapim.just.pro.br/posts?search=$s&page=$p&feed=$f';
      }
      final http.Client cliente = http.Client();
      try 
      {
        http.Response? resp = await cliente.get
        (
          Uri.parse(url),
          headers: 
          {
            'X-Session-Token': token,
            'Content-Type': 'application/json',
          },
        );

        List<dynamic> posts = json.decode(resp.body);
         
        switch (resp.statusCode)
        {
          case 200:
            return posts.map((json) => Post.fromJson(json)).toList();
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
    else 
    {
      throw Exception("Erro de autenticação!");
    }
  }

  Future<List<Post>> listarPostsUsuario(String u, int? p) async 
  {
    final token = await getToken();
    if (token != null) 
    {
      final http.Client cliente = http.Client();
      try 
      {
        String url = "";
        if(p==null)
        {
          url = 'https://api.papacapim.just.pro.br/users/$u/posts';
        }
        else
        {
          url = 'https://api.papacapim.just.pro.br/users/$u/posts?page=$p';
        }
        http.Response? resp = await cliente.get
        (
          Uri.parse(url),
          headers: 
          {
            'X-Session-Token': token,
            'Content-Type': 'application/json',
          },
        );

        List<dynamic> posts = json.decode(resp.body);
        
        switch (resp.statusCode)
        {
          case 200:
            return posts.map((json) => Post.fromJson(json)).toList();
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
    else 
    {
      throw Exception("Erro de autenticação!");
    }
  }

  Future<List<Post>> listarPostsUsuarioLogado(int? p) async 
  {
    final token = await getToken();
    final us = await getUsername();
    if (token != null) 
    {
      final http.Client cliente = http.Client();
      try 
      {
        String? url = "";
        if(p==null)
        {
          url = 'https://api.papacapim.just.pro.br/users/$us/posts';
        }
        else 
        {
          url = 'https://api.papacapim.just.pro.br/users/$us/posts?page=$p';
        }
        http.Response? resp = await cliente.get
        (
          Uri.parse(url),
          headers: 
          {
            'X-Session-Token': token,
            'Content-Type': 'application/json',
          },
        );

        List<dynamic> posts = json.decode(resp.body);
      
        switch (resp.statusCode)
        {
          case 200:
            return posts.map((json) => Post.fromJson(json)).toList();
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
    else 
    {
      throw Exception("Erro de autenticação!");
    }
  }

  Future<Post> novoPost(PostNovo pu) async 
  {
    final token = await getToken();
    if (token != null) 
    {
      var postNovo = json.encode(pu.toJson());

      final http.Client cliente = http.Client();
      try 
      {
        http.Response? resp = await cliente.post(
          Uri.parse('https://api.papacapim.just.pro.br/posts'),
          headers: 
          {
            'X-Session-Token': token,
            'Content-Type': 'application/json',
          },
          body: postNovo,
        );

        switch (resp.statusCode)
        {

          case 201:
            return Post.fromJson(json.decode(resp.body));
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
    else 
    {
      throw Exception("Erro de autenticação!");
    }
  }
  Future<Post> responderPost(PostResposta pu, int cp) async 
  {
    final token = await getToken();
    if (token != null) 
    {
      var resposta = json.encode(pu.toJson());

      final http.Client cliente = http.Client();
      try 
      {
        http.Response? resp = await cliente.post(
          Uri.parse('https://api.papacapim.just.pro.br/posts/$cp/replies'),
          headers: 
          {
            'X-Session-Token': token,
            'Content-Type': 'application/json',
          },
          body: resposta,
        );
        
        switch (resp.statusCode)
        {
          case 200:
            throw Exception("Resposta enviada!");
          case 201:
            return Post.fromJson(json.decode(resp.body));
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
    else 
    {
      throw Exception("Erro de autenticação!");
    }
  }


  Future<List<Post>> listarRespostas(int cp, int? p) async 
  {
    final token = await getToken();
    if (token != null) 
    {

      final http.Client cliente = http.Client();
      try 
      {
        http.Response? resp = await cliente.get(
          Uri.parse('https://api.papacapim.just.pro.br/posts/$cp/replies?page=$p'),
          headers: 
          {
            'X-Session-Token': token,
            'Content-Type': 'application/json',
          },
        );
        List<dynamic> respostas = json.decode(resp.body);

        switch (resp.statusCode)
        {
          case 200:
            return respostas.map((json) => Post.fromJson(json)).toList();
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
    else 
    {
      throw Exception("Erro de autenticação!");
    }
  }

  Future<void> excluirPost(int ps) async
  {
    final token = await getToken();
    if(token!=null)
    {
      final http.Client cliente = http.Client();

        try
        {
          http.Response? resp = await cliente.delete
          (
            Uri.parse('https://api.papacapim.just.pro.br/posts/$ps'),
            headers: {
              'X-Session-Token': token,
              'Content-Type': 'application/json',
            },
          ); 
          switch (resp.statusCode)
        {
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
    else
    {
      throw Exception("Erro de autenticação!");
    }
    

  }

  Future<Curtida> curtirPost(int pi) async
  {
    final token = await getToken();
    if(token!=null)
    {
      final http.Client cliente = http.Client();
      try 
      {
        http.Response? resp = await cliente.post(
          Uri.parse('https://api.papacapim.just.pro.br/posts/$pi/likes'),
          headers: 
          {
            'X-Session-Token': token,
            'Content-Type': 'application/json',
          },
        );
 
        switch (resp.statusCode)
        {
          case 201:
            return Curtida.fromJson(json.decode(resp.body));
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
    else 
    {
      throw Exception("Erro de autenticação!");
    }
  }

  Future<List<Curtida>> listarCurtidas(int pi) async
  {
    final token = await getToken();
    if(token!=null)
    {
      final http.Client cliente = http.Client();
      try 
      {
        http.Response? resp = await cliente.get(
          Uri.parse('https://api.papacapim.just.pro.br/posts/$pi/likes'),
          headers: 
          {
            'X-Session-Token': token,
            'Content-Type': 'application/json',
          },
        );
        List<dynamic> curtidas = json.decode(resp.body);
         
        switch (resp.statusCode)
        {
          case 200:
            return curtidas.map((json) => Curtida.fromJson(json)).toList();
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
    else 
    {
      throw Exception("Erro de autenticação!");
    }
  }

  Future<void> excluirCurtida(int ps) async
  {
    final token = await getToken();
    if(token!=null)
    {
      final http.Client cliente = http.Client();

        try
        {
          http.Response? resp = await cliente.delete
          (
            Uri.parse('https://api.papacapim.just.pro.br/posts/$ps/likes/1'),
            headers: {
              'X-Session-Token': token,
              'Content-Type': 'application/json',
            },
          ); 
          switch (resp.statusCode)
        {
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
    else
    {
      throw Exception("Erro de autenticação!");
    }

  }


  Future<List<Sessao>> listarSessoes() async
  {
    final token = await getToken();
    if(token!=null)
    {
      final http.Client cliente = http.Client();
      try
      {
        final url = Uri.parse('https://api.papacapim.just.pro.br/sessions');
        final resp = await cliente.get
        (
          url,
          headers: {
              'X-Session-Token': token,
              'Content-Type': 'application/json',
            },
        );
        List<dynamic> sessoes = json.decode(resp.body);
        
        switch (resp.statusCode)
        {
          case 200:
            return sessoes.map((json) => Sessao.fromJson(json)).toList();
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
    else 
    {
      throw Exception("Erro de autenticação!");
    }
  }

  Future<void> apagarSessao(int st) async
  {
    final token = await getToken();
    if(token!=null)
    {
      final http.Client cliente = http.Client();

        try
        {
          http.Response? resp = await cliente.delete
          (
            Uri.parse('https://api.papacapim.just.pro.br/sessions/$st'),
            headers: {
              'X-Session-Token': token,
              'Content-Type': 'application/json',
            },
          ); 
        switch (resp.statusCode)
        {
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
    else
    {
      throw Exception("Erro de autenticação!");
    }

  }

}