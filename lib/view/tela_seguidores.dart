import 'package:flutter/material.dart';

import '../controller/ger_seguidores.dart';

class VerSeguidores extends StatefulWidget
{
  const VerSeguidores({super.key, required this.usuario});

  @override
  State<VerSeguidores> createState() => _VerSeguidoresState();

  final String usuario;
}

class _VerSeguidoresState extends State<VerSeguidores> 
{

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar(title: Text('Seguidores')),
      //body: GerFeedUsuario(),
      body: Padding
      (
        padding: const EdgeInsets.all(8.0),
        child: Center
        (
          
          child: GerSeguidores(meusSeguidores: widget.usuario,),
        ),

      ),
     

       
    );
  }
}