import 'package:flutter/material.dart';

import '../model/post.dart';
import 'api_service/api_acesso.dart';
import 'api_service/api_principal.dart';
import 'repository/repo_usuario.dart';


class GerCurtidores extends StatefulWidget 
{
  const GerCurtidores({super.key, required this.meusCurtidores, });

  @override
  State<GerCurtidores> createState() => _GerCurtidoresState();
  final int meusCurtidores;
}

class _GerCurtidoresState extends State<GerCurtidores>
{
  final RepoUsuario _repositorioCurtidores = RepoUsuario(ApiPrincipal(), ApiAcesso());
  late Future<List<Curtida>> _curtidores;


  @override
  void initState()
  {
    super.initState();
    _curtidores = _repositorioCurtidores.listarCurtidas(widget.meusCurtidores);
  }



  @override
  Widget build(BuildContext context) 
  {
    
    return FutureBuilder
    (
      future: _curtidores,
      builder: (context, snapshot)
      {
        if(snapshot.hasData)
        {
          if(snapshot.data!.isEmpty)
          {
            return const AlertDialog
            (
              content: Text('Não há curtidas!'),
            );
          }
          else
          {
            return ListView
          (
            children: 
            [
              for(var s in snapshot.data!)
              Card
              (
                child: ListBody
                    (
                      children: 
                      [
                        ListTile
                        (
                        title: Text(s.usrLogin),
                        trailing: Text(s.dataCriacao),
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
