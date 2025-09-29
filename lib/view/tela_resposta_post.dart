import 'package:flutter/material.dart';

import '../controller/ger_respostas.dart';

class VerRespostas extends StatefulWidget
{
  const VerRespostas({super.key, required this.postId});

  @override
  State<VerRespostas> createState() => _VerRespostasState();

  final int postId;
}

class _VerRespostasState extends State<VerRespostas> 
{
  //get idPost => null;

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar(title: Text('Respostas')),
      //body: GerFeedUsuario(),
      body: Padding
      (
        padding: const EdgeInsets.all(8.0),
        child: Center
        (
          
          child: GerRespostas(codPostResposta: widget.postId,),
        ),

      ),
     

       
    );
  }
}