import 'package:flutter/material.dart';
import '../model/post.dart';
import '../view/tela_resposta_post.dart';
import 'api_service/api_acesso.dart';
import 'api_service/api_principal.dart';
import 'repository/repo_usuario.dart';

class MostrarRespostasPost extends StatefulWidget
{
  const MostrarRespostasPost({super.key, required this.indiceRespostaPost});

  @override
  //State<StatefulWidget> createState() => _MostrarRespostasPostState();
  State<MostrarRespostasPost> createState() => _MostrarRespostasPostState();

  final int indiceRespostaPost;
}

class _MostrarRespostasPostState extends State<MostrarRespostasPost>
{
  final RepoUsuario _repositorioRespostas = RepoUsuario(ApiPrincipal(), ApiAcesso());

  late Future<List<Post>> _respostas;
  late int quantRespostas;
  
   @override
  void initState()
  {
    super.initState();
    _respostas = _repositorioRespostas.getRespostas(widget.indiceRespostaPost, null);
  }
  
  void mostrarRespostas(int a)
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
            builder: (builder) => VerRespostas(postId: a,),
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
      future: _respostas,
      builder: (context, snapshot)
      {
        if(snapshot.hasData)
        {
          if(snapshot.data!.isEmpty)
          {
            quantRespostas = 0;
             return ElevatedButton
            (
              child: 
              Row
              (
                children: 
                [
                  Icon(Icons.question_answer),
                  Text("$quantRespostas"),
                ],
              ),
              
              onPressed: () 
              {
               
        
              }
            );

          }
          else
          {
            quantRespostas = snapshot.data!.length;
            return ElevatedButton
            (
              child: 
              Row
              (
                children: 
                [
                  Icon(Icons.question_answer),
                  Text("$quantRespostas"),
                ],
              ),
              
              onPressed: () 
              {
                mostrarRespostas(widget.indiceRespostaPost);
        
              }
            );

          }
          
        }
        else if(snapshot.hasError)
        {
          return ElevatedButton
          (
            child: 
            Row
              (
                children: 
                [
                  Icon(Icons.question_answer),
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