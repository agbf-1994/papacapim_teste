import 'package:flutter/material.dart';
import '../model/post.dart';
import '../view/tela_curtidas.dart';
import 'api_service/api_acesso.dart';
import 'api_service/api_principal.dart';
import 'repository/repo_usuario.dart';

class MostrarCurtidas extends StatefulWidget
{
  const MostrarCurtidas({super.key, required this.indiceCurtidaPost});

  @override
  //State<StatefulWidget> createState() => _MostrarCurtidasState();
  State<MostrarCurtidas> createState() => _MostrarCurtidasState();

  final int indiceCurtidaPost;
}

class _MostrarCurtidasState extends State<MostrarCurtidas>
{
  final RepoUsuario _repositorioCurtidores = RepoUsuario(ApiPrincipal(), ApiAcesso());

  late Future<List<Curtida>> _curtidores;
  late int quantCurtidas;
  
   @override
  void initState()
  {
    super.initState();
    _curtidores = _repositorioCurtidores.listarCurtidas(widget.indiceCurtidaPost);
  }

  void mostrarCurtidas(int a)
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
            builder: (builder) => VerCurtidas(indicePost: a,),
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
      future: _curtidores,
      builder: (context, snapshot)
      {
        if(snapshot.hasData)
        {
          if(snapshot.data!.isEmpty)
          {
            quantCurtidas = 0;
             return ElevatedButton
            (
              child: 
              Row
              (
                children: 
                [
                  Icon(Icons.thumb_up_outlined),
                  Text("$quantCurtidas"),
                ],
              ),
              
              onPressed: () 
              {
               
        
              }
            );

          }
          else
          {
            quantCurtidas = snapshot.data!.length;
            return ElevatedButton
            (
              child: 
              Row
              (
                children: 
                [
                  Icon(Icons.thumb_up_outlined),
                  Text("$quantCurtidas"),
                ],
              ),
              
              onPressed: () 
              {
                mostrarCurtidas(widget.indiceCurtidaPost);
        
              }
            );

          }
          
        }
        else if(snapshot.hasError)
        {
          return ElevatedButton
          (
            child: Row
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