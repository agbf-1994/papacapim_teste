import 'package:flutter/material.dart';

import '../view/tela_curtidas.dart';

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
    return ElevatedButton
      (
        child: const Icon(Icons.face),
        
        onPressed: () 
        {
          mostrarCurtidas(widget.indiceCurtidaPost);
   
        }
      );
  }
}