import 'package:flutter/material.dart';

import '../controller/ger_sessao.dart';
import 'menu_lateral.dart';

class TelaSessao extends StatelessWidget
{
  const TelaSessao({super.key});

  @override
  Widget build(BuildContext context) 
  {
    
    return Scaffold
    (
      appBar: AppBar(title: Text('Sessões')),

      drawer: const MenuLateral(),

      body: Padding
      (
        padding: const EdgeInsets.all(8.0),
        child: Center
        (
          child: GerSessao(),
        )
      )

      //body: GerSessao(),

    );
    
    
  }
}
