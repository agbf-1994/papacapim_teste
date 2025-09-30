import 'package:flutter/material.dart';

import 'menu_lateral.dart';

class Sobre extends StatelessWidget
{
  const Sobre({super.key});

  @override
  Widget build(BuildContext context) 
  {
    
    return Scaffold
    (
      appBar: AppBar(title: Text('Sobre o Aplicativo')),

      drawer: const MenuLateral(),

      body: Padding
      (
        padding: const EdgeInsets.all(8.0),
        child: Center
        (
          
          child: Column
          (
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 16.0,
            children: 
            [
              const Text('(c)2025 Equipe do Papacapim. Todos os direitos reservados.'),
              const Text('Versão 0.02r30092925'),
              const Text('Produzido por: Alvaro Gabriel')
            ]
          )
        )
      )

    );
    
    
  }

}