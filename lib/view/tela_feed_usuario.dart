import 'package:flutter/material.dart';

import '../controller/novo_post.dart';
import '../controller/organizador_feed.dart';
import 'menu_lateral.dart';


class FeedUsuario extends StatefulWidget
{
  const FeedUsuario({super.key});

  @override
  State<FeedUsuario> createState() => _FeedUsuarioState();

}

class _FeedUsuarioState extends State<FeedUsuario>
{
  @override
  Widget build(BuildContext context)
  {
    
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text('Feed do usuário ')
        /*
        actions: 
        [
          

        ],
        */
      ),
      drawer: const MenuLateral(),
      body: Padding
      (
        padding: const EdgeInsets.all(8.0),
        child: Center
        (
          child: OrganizadorFeed(),
        ),

      ),
      floatingActionButton: NovoPost(),
     

       
    );
    

  }
}