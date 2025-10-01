import 'package:flutter/material.dart';
import 'package:papacapim_v02/controller/mostrar_alerta.dart';

import '../model/usuario.dart';
import 'api_service/api_acesso.dart';
import 'api_service/api_principal.dart';
import 'repository/repo_usuario.dart';

class Seguir extends StatefulWidget
{
  const Seguir({super.key, required this.seguido});

  @override
  State<StatefulWidget> createState() => _SeguirState();
  final String seguido;
}

class _SeguirState extends State<Seguir>
{
  final RepoUsuario _repositorioSeguidores = RepoUsuario(ApiPrincipal(), ApiAcesso());
  
  Future<void> seguir(String us)
  async {

    try
    {
      Seguidor _ = await _repositorioSeguidores.seguirUsuario(us);
      if(mounted)
      {
        setState
        (
          () 
          {
            //print('Usuário seguido!');
        
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
        seguir(widget.seguido);
                                        
      },
      child: const Text('Seguir'),
    );
    
  }
}