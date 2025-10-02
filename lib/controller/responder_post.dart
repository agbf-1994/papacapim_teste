import 'package:flutter/material.dart';

import '../model/post.dart';
import '../view/tela_feed_usuario.dart';
import '../view/tela_responder_post.dart';
import 'api_service/api_acesso.dart';
import 'api_service/api_principal.dart';
import 'repository/repo_usuario.dart';

class ResponderPost extends StatefulWidget {
  const ResponderPost({super.key, required this.indiceRespostaPost});

  @override
  State<ResponderPost> createState() => _ResponderPostState();
  final int indiceRespostaPost;
}

class _ResponderPostState extends State<ResponderPost> {
  final RepoUsuario _repositorioPosts = RepoUsuario(
    ApiPrincipal(),
    ApiAcesso(),
  );

  void _responderPost(String m, int c) async 
  {
    c = widget.indiceRespostaPost;
    
    try 
    {
      PostResposta resposta = PostResposta(message: m);
      await _repositorioPosts.responderPost(resposta, c);
      
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
    } 
    catch (e) 
    {
      AlertDialog(title: Text(e.toString()));
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton
      (
        child: const Icon(Icons.add_comment),
        
        onPressed: () 
        {
          Navigator.push
          (
            context, 
            MaterialPageRoute
            (
              builder: (context) => ResponderPostagem(responderPost: _responderPost,)
            )
          );
        }
      );
  }
}
