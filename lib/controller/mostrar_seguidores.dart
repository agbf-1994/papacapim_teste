import 'package:flutter/material.dart';

import '../view/tela_seguidores.dart';

class MostrarSeguidores extends StatefulWidget
{
  const MostrarSeguidores({super.key, required this.loginUsuario});

  @override
  //State<StatefulWidget> createState() => _MostrarRespostasPostState();
  State<MostrarSeguidores> createState() => _MostrarSeguidoresState();

  final String loginUsuario;
}

class _MostrarSeguidoresState extends State<MostrarSeguidores>
{
  
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
    return ElevatedButton
      (
        child: const Icon(Icons.group),
        
        onPressed: () 
        {
          mostrarSeguidores(widget.loginUsuario);
   
        }
      );
  }
}