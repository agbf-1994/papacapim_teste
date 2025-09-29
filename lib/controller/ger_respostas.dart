import 'package:flutter/material.dart';
import 'package:papacapim_v02/controller/mostrar_curtidas.dart';

import 'api_service/api_acesso.dart';
import 'api_service/api_principal.dart';
import 'curtir_post.dart';
import 'repository/repo_usuario.dart';

import '../model/post.dart';


class GerRespostas extends StatefulWidget 
{
  const GerRespostas({super.key, required this.codPostResposta, });

  @override
  //State<StatefulWidget> createState() => _GerRespostasState();
  State<GerRespostas> createState() => _GerRespostasState();
  final int codPostResposta;
}

class _GerRespostasState extends State<GerRespostas>
{
  final RepoUsuario _repositorioRespostas = RepoUsuario(ApiPrincipal(), ApiAcesso());
  late Future<List<Post>> _respostas;

  @override
  void initState()
  {
    super.initState();
    _respostas = _repositorioRespostas.getRespostas(widget.codPostResposta, null);
  }
  @override
  Widget build(BuildContext context) 
  {
    
    return FutureBuilder
    (
      future: _respostas,
      builder: (context, snapshot)
      {
        if(snapshot.hasData)
        {
          if(snapshot.data!.isEmpty)
          {
            return const AlertDialog
            (
              content: Text('Não há respostas!'),
            );
            /*
            return Center
            (
              child: const Text('Não há respostas'),
            );
            */
          }
          else
          {
            return ListView
          (
            children: 
            [
              for(var p in snapshot.data!)
              Card
              (
                child: ListBody
                    (
                      children: 
                      [
                        ListTile
                        (
                        title: Text(p.usrLogin),
                        subtitle: Text(p.message),
                        ),
                        SizedBox(height: 10.0,),
                        Row
                        (
                          spacing: 12.0,
                        
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: 
                          [
                            
                            
                            Curtir(curtido: p.id,),
                            MostrarCurtidas(indiceCurtidaPost: p.id)
                          ],
                        ),
                        SizedBox(height: 10.0,),

                      ],
                    ),

              )
            ],
          );

          }
          

        }
        else if(snapshot.hasError)
        {
          return const Center
          (
            child: Text("Erro de requisição"),
          );

        }
        else
        {
          return const Center
          (
            child: CircularProgressIndicator(),
          );

        }
      }
    );
  }
  
}