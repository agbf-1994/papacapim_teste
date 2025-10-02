import 'package:flutter/material.dart';

import '../model/post.dart';
import '../view/tela_feed_usuario.dart';
import '../view/tela_nova_postagem.dart';
import 'api_service/api_acesso.dart';
import 'api_service/api_principal.dart';
import 'repository/repo_usuario.dart';

class NovoPost extends StatefulWidget {
  const NovoPost({super.key});

  @override
  State<NovoPost> createState() => _NovoPostState();
}

class _NovoPostState extends State<NovoPost> {
  final RepoUsuario _repositorioPosts = RepoUsuario(
    ApiPrincipal(),
    ApiAcesso(),
  );

  void _novoPost(String m) async 
  {
    try 
    {
      PostNovo postNovo = PostNovo(message: m);
      await _repositorioPosts.postar(postNovo);
      if(mounted)
      {
        setState
        (
          () 
          {
            Navigator.push
            (
              context,
              MaterialPageRoute(
              builder: (builder) => FeedUsuario(),
              )
            );
          
          },
        );
      }
    } catch (e) {
      AlertDialog(title: Text(e.toString()));
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton
      (
        child: const Icon(Icons.add),
        onPressed: () 
        {
          Navigator.push
          (
            context, 
            MaterialPageRoute
            (
              builder: (context) => NovaPostagem(novoPost: _novoPost,),
            )
          );
        }
      );
  }
}
