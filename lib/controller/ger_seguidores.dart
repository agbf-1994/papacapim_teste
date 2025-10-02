import 'package:flutter/material.dart';

import '../model/usuario.dart';
import 'api_service/api_acesso.dart';
import 'api_service/api_principal.dart';
import 'repository/repo_usuario.dart';
import 'seguir.dart';

class GerSeguidores extends StatefulWidget 
{
  const GerSeguidores({super.key, required this.meusSeguidores, });

  @override
 
  State<GerSeguidores> createState() => _GerSeguidoresState();
  final String meusSeguidores;
}

class _GerSeguidoresState extends State<GerSeguidores>
{
  final RepoUsuario _repositorioSeguidores = RepoUsuario(ApiPrincipal(), ApiAcesso());
  late Future<List<Seguidor>> _seguidores;

  @override
  void initState()
  {
    super.initState();
    _seguidores = _repositorioSeguidores.listarSeguidores(widget.meusSeguidores);
  }
  @override
  Widget build(BuildContext context) 
  {
    
    return FutureBuilder
    (
      future: _seguidores,
      builder: (context, snapshot)
      {
        if(snapshot.hasData)
        {
          if(snapshot.data!.isEmpty)
          {
            return const AlertDialog
            (
              content: Text('Não há seguidores!'),
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
                        title: Text(s.nomeSeg),
                        trailing: Text(s.dataCriacao),
                        ),
                        SizedBox(height: 10.0,),
                        Row
                        (
                          spacing: 12.0,
                        
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: 
                          [
                            
                            Seguir(seguido: s.nomeSeg,),
                            
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