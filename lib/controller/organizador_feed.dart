import 'package:flutter/material.dart';

import 'ger_feed_usuario.dart';
//import 'responder_post.dart';

class OrganizadorFeed extends StatefulWidget
{
  const OrganizadorFeed({super.key});

  @override
  State<StatefulWidget> createState() => _OrganizadorFeedState();
}

class _OrganizadorFeedState extends State<OrganizadorFeed>
{

  final GerFeedUsuario _geFeedUsuarios = GerFeedUsuario();
  
  void _organizar(String? tm, int? pg, int? fd)
  {
    setState
    (
      () 
      {
        _geFeedUsuarios.sortear(tm!, pg!, fd!);
        
        
      }
    );
  }


  @override
  Widget build(BuildContext context) 
  {
    return Column
    (
      children: 
      [
        SizedBox(height: 10.0,),
        Card
        (
          child: ListBody
          (
            children: 
            [
              Row
              (
                spacing: 12.0,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: 
                [
                  ElevatedButton
                  (
                    child: const Text("Feed completo"),
                    
                    onPressed: () 
                    {
                      _organizar("", 0, 0);
                      
                    }
                  ),
                  ElevatedButton
                  (
                    child: const Text("Seus amigos"),
                    
                    onPressed: () 
                    {
                      _organizar("", 0, 1);
                    }
                  ),
                  

                ],
              )

            ],
          )

        ), 
        SizedBox(height: 10.0,),
        Expanded
        (
          child: _geFeedUsuarios.build(context),

        ),
      ],

    );

  }
}