import 'package:flutter/material.dart';

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
  late Future<Seguidor> _seguidor;

  void seguir(String us)
  {
    _seguidor = _repositorioSeguidores.seguirUsuario(us);
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