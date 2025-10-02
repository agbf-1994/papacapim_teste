import 'package:flutter/material.dart';

import '../controller/cont_perfil.dart';
import '../controller/novo_post.dart';
import 'menu_lateral.dart';

class Perfil extends StatefulWidget
{
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
  
}

class _PerfilState extends State<Perfil>
{

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar(title: Text('Perfil do Usuário')),
      drawer: const MenuLateral(),
      body: Padding
      (
        padding: const EdgeInsets.all(8.0),
        child: Center
        (
          child: ContPerfil(),
        ),

      ),
      floatingActionButton: NovoPost(),
      
    );

    
  }

}