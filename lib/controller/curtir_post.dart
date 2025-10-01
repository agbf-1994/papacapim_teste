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

  Future<void> curtir(int cc)
  async {
    try
    {
      Curtida _ = await _post.curtirPost(cc);
      if(mounted)
      {
        setState
        (
          () 
          {
            
            
        
          }
        );
      }

    }
    catch(e)
    {
      mostrarAlerta(context, e.toString());
    }
    
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