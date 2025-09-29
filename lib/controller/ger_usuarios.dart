import 'package:flutter/material.dart';

import '../model/usuario.dart';
import 'api_service/api_acesso.dart';
import 'api_service/api_principal.dart';
import 'mostrar_seguidores.dart';
import 'repository/repo_usuario.dart';
import 'seguir.dart';


class GerUsuarios extends ChangeNotifier
{
  final RepoUsuario _repositorioUsuarios = RepoUsuario(ApiPrincipal(), ApiAcesso());

  
  late Future<List<UsuarioConta>> _listaFiltrada = _repositorioUsuarios.buscarUsuario("");

  void pesquisar(String usr)
  {
    _listaFiltrada = _repositorioUsuarios.buscarUsuario(usr);
    notifyListeners();

  }


  Widget build(BuildContext context) 
  {
    return FutureBuilder
        (
          future: _listaFiltrada, 
          builder: (context, snapshot)
          {
            
            if(snapshot.hasData)
            {
              return ListView
              (
                children: 
                [
                  for (var u in snapshot.data!)
                  Card(
                    child: ListBody
                    (
                      children: 
                      [
                        ListTile
                        (
                        title: Text(u.login),
                        trailing: Text(u.name),
                        ),
                        SizedBox(height: 10.0,),
                        Row
                        (
                          spacing: 12.0,
                        
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: 
                          [
                            
                            MostrarSeguidores(loginUsuario: u.login,),
                            Seguir(seguido: u.login,),
                          ],
                        ),
                        SizedBox(height: 10.0,),

                      ],
                    ),
                  ),
                  
                ],
              );

            }
            
            else if(snapshot.hasError)
            {
              return const Center
              (
                child: Text('Erro de carregamento'),
              );

            }
            else
            {
              return const Center(child: CircularProgressIndicator());

            }
          },
        );
  }
  
}

