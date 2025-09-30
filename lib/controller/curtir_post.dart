import 'package:flutter/material.dart';

import '../model/post.dart';
import 'api_service/api_acesso.dart';
import 'api_service/api_principal.dart';
import 'mostrar_alerta.dart';
import 'repository/repo_usuario.dart';

class Curtir extends StatefulWidget
{
  const Curtir({super.key, required this.curtido});

  @override
  State<StatefulWidget> createState() => _CurtirState();
  final int curtido;
}

class _CurtirState extends State<Curtir>
{
  final RepoUsuario _post = RepoUsuario(ApiPrincipal(), ApiAcesso());
  late Future<Curtida> _postCurtido;

  void curtir(int cc)
  {
    _postCurtido = _post.curtirPost(cc);
    if(mounted)
    {
      setState
      (
        () 
        {
          
          
      
        }
      );

    }
    _postCurtido.catchError
    (
      (error)
      {
        mostrarAlerta(context, error.toString());
        return error;
        
      }
    ).then
    (
      (value) 
      {
        mostrarAlerta(context, "Você curtiu o post, ${value.usrLogin}!");

      
      },
    );
    
  }


  @override
  Widget build(BuildContext context) 
  {
    return ElevatedButton
    (
      onPressed: () 
      {
        curtir(widget.curtido);
                                        
      },
      child: const Icon(Icons.thumb_up),
    );
    
  }
}