import 'package:flutter/material.dart';

import '../model/usuario.dart';
import '../view/tela_seguidores.dart';
import 'api_service/api_acesso.dart';
import 'api_service/api_principal.dart';
import 'repository/repo_usuario.dart';

class MostrarSeguidores extends StatefulWidget
{
  const MostrarSeguidores({super.key, required this.loginUsuario});

  @override
  State<MostrarSeguidores> createState() => _MostrarSeguidoresState();

  final String loginUsuario;
}

class _MostrarSeguidoresState extends State<MostrarSeguidores>
{
   final RepoUsuario _repositorioSeguidores = RepoUsuario(ApiPrincipal(), ApiAcesso());

  late Future<List<Seguidor>> _seguidores;
  late int quantSeguidores;
  
   @override
  void initState()
  {
    super.initState();
    _seguidores = _repositorioSeguidores.listarSeguidores(widget.loginUsuario);
  }
  
  void mostrarSeguidores(String s)
  {
    setState
    (
      () 
      {
        Navigator.push
        (
          context,
          MaterialPageRoute
          (
            builder: (builder) => VerSeguidores(usuario: s,),
          )
        );
      
      }
    );
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
            quantSeguidores = 0;
             return IconButton
            (
              icon: 
              Row
              (
                children: 
                [
                  Icon(Icons.group),
                  Text("$quantSeguidores"),
                ],
              ),
              
              onPressed: () 
              {
               
        
              }
            );

          }
          else
          {
            quantSeguidores = snapshot.data!.length;
            return IconButton
            (
              icon: 
              Row
              (
                children: 
                [
                  Icon(Icons.group),
                  Text("$quantSeguidores"),
                ],
              ),
              
              onPressed: () 
              {
                mostrarSeguidores(widget.loginUsuario);
        
              }
            );

          }
          
        }
        else if(snapshot.hasError)
        {
          return IconButton
          (
            icon: 
            Row
              (
                children: 
                [
                  Icon(Icons.group),
                  Icon(Icons.error),
                ],
              ),
            
            onPressed: () 
            {
      
            }
          );
        }
        else
        {
          return ElevatedButton
          (
            child: const Icon(Icons.stop),
            
            onPressed: () 
            {
      
            }
          );

        }
      }
    );
    
  }
}