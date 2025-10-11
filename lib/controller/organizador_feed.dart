import 'package:flutter/material.dart';

import 'ger_feed_usuario.dart';


class OrganizadorFeed extends StatefulWidget
{
  const OrganizadorFeed({super.key});

  @override
  State<StatefulWidget> createState() => _OrganizadorFeedState();
}

class _OrganizadorFeedState extends State<OrganizadorFeed>
{

  final GerFeedUsuario _geFeedUsuarios = GerFeedUsuario();
  late String _termo;
  int _pagina = 0;
  
  void _organizar(String? tm, int? pg, int? fd)
  {
    setState
    (
      () 
      {
        _geFeedUsuarios.sortear(tm, pg, fd);
        
        
      }
    );
  }

  void _atualizar()
  {
    setState
    (
      () 
      {
        _geFeedUsuarios.atualizar();
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
        TextField
            (
              decoration: const InputDecoration
              (
                labelText: 'Buscar',
                border: OutlineInputBorder(),
              ),
              onChanged: (valor)
              {
                _termo = valor;
                _organizar(_termo, null, null);

              },
            ),
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
                  TextButton
                  (
                    child: const Text("Feed completo"),
                    
                    onPressed: () 
                    {
                      _organizar(null, null, 0);
                      
                    }
                  ),
                  TextButton
                  (
                    child: const Text("Seus amigos"),
                    onPressed: () 
                    {
                      _organizar(null, null, 1);
                      
                      
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
        Card
        (
          child: Row
          (
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: 
            [
              IconButton
              (
                icon: Icon(Icons.arrow_back),
                onPressed: 
                ()
                {
                  _organizar(null, _pagina--, null);

                },
              ),
              IconButton
              (
                icon: Icon(Icons.update),
                onPressed: 
                ()
                {
                  _atualizar();

                },
              ),
              IconButton
              (
                icon: Icon(Icons.arrow_forward),
                onPressed: 
                ()
                {
                  _organizar(null, _pagina++, null);

                },
              ),
            ],
          ),
        )
      ],

    );

  }
}