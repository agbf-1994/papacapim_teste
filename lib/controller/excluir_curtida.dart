import 'package:flutter/material.dart';
import 'package:papacapim_v02/controller/mostrar_alerta.dart';

import 'api_service/api_acesso.dart';
import 'api_service/api_principal.dart';
import 'repository/repo_usuario.dart';

class ExcluirCurtida extends StatefulWidget
{
  const ExcluirCurtida({super.key, required this.curtidaAExcluir});

  @override
  State<StatefulWidget> createState() => _ExcluirCurtidaState();
  final int curtidaAExcluir;
}

class _ExcluirCurtidaState extends State<ExcluirCurtida>
{
  final RepoUsuario _repositorioCurtidas = RepoUsuario(ApiPrincipal(), ApiAcesso());
  

  void _excluirCurtida(int pe)
  async {
    try
    {
      await _repositorioCurtidas.apagarCurtida(pe);
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
        _excluirCurtida(widget.curtidaAExcluir);
                                        
      },
      child: const Icon(Icons.thumb_down),
    );
    
  }
}