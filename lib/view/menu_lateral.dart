import 'package:flutter/material.dart';

import '../controller/autenticacao.dart';
import 'tela_busca_usuario.dart';
import 'tela_feed_usuario.dart';
//import 'tela_lista_usuario.dart';
import 'tela_perfil.dart';
import 'tela_sessao.dart';
import 'tela_sobre.dart';

class MenuLateral extends StatelessWidget
{
  const MenuLateral({super.key});

  
  @override
  Widget build(BuildContext context) 
  {
    return NavigationDrawer
    (
      onDestinationSelected: (opcao)
        {
          switch(opcao)
          {
            case 0:
              Navigator.of(context).pushReplacement
              (
                MaterialPageRoute
                (
                  builder: (builder) => const FeedUsuario(),
                )
              );
            case 1:
              Navigator.of(context).pushReplacement
              (
                MaterialPageRoute
                (
                  builder: (builder) => const Perfil(),
                )
              );
            
            case 2:
            
              Navigator.of(context).pushReplacement
              (
                MaterialPageRoute
                (
                  builder: (builder) => const BuscaUsuario(),
                )
              );
            
            case 3:
              Navigator.of(context).pushReplacement
              (
                MaterialPageRoute
                (
                  builder: (builder) => const TelaSessao(),
                )
              );
            case 4:
              Navigator.of(context).pushReplacement
              (
                MaterialPageRoute
                (
                  builder: (builder) => const Sobre()
                )
              );
            
          }
        },
        children:
        [
          Padding
          (
            padding: const EdgeInsets.all(8.0),
            child: const Text
            (
              'Menu principal',
              style: TextStyle
              (
                fontSize: 24.0,
                fontWeight: FontWeight.bold,

              ),
            
            ),
            
          ),
          NavigationDrawerDestination
          (
            icon: Icon(Icons.list), 
            label: const Text('Feed do usuário'),
          ),
          NavigationDrawerDestination
          (
            icon: Icon(Icons.person_2_outlined), 
            label: const Text('Perfil'),
          ),
          
          NavigationDrawerDestination
          (
            icon: Icon(Icons.search), 
            label: const Text('Buscar'),
          ),
          
          NavigationDrawerDestination
          (
            icon: Icon(Icons.safety_check), 
            label: const Text('Sessões'),
          ),
          NavigationDrawerDestination
          (
            icon: Icon(Icons.android), 
            label: const Text('Sobre...'),
          ),
          

        ]
      );

    
  }
}