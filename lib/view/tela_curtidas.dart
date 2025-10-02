import 'package:flutter/material.dart';

import '../controller/ger_curtidores.dart';

class VerCurtidas extends StatefulWidget
{
  const VerCurtidas({super.key, required this.indicePost});

  @override
  State<VerCurtidas> createState() => _VerCurtidasState();

  final int indicePost;
}

class _VerCurtidasState extends State<VerCurtidas> 
{

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar(title: Text('Quem curtiu a mensagem')),
      body: Padding
      (
        padding: const EdgeInsets.all(8.0),
        child: Center
        (
          
          child: GerCurtidores(meusCurtidores: widget.indicePost,),
        ),

      ),
     

       
    );
  }
}