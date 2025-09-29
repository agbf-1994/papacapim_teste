import 'package:flutter/material.dart';
import '../view/tela_resposta_post.dart';

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
    return ElevatedButton
      (
        child: const Icon(Icons.question_answer),
        
        onPressed: () 
        {
          mostrarRespostas(widget.indiceRespostaPost);
   
        }
      );
  }
}