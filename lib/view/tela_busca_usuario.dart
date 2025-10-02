import 'package:flutter/material.dart';

import '../controller/ger_usuarios.dart';
import 'menu_lateral.dart';


class BuscaUsuario extends StatefulWidget
{
  const BuscaUsuario({super.key});
  

  @override
  State<BuscaUsuario> createState() => _BuscaUsuarioState();

}

class _BuscaUsuarioState extends State<BuscaUsuario>
{
  
  final GerUsuarios _gerUsuarios = GerUsuarios();


  
  void _buscar(String? tx)
  {
    setState
    (
      () 
      {
        _gerUsuarios.pesquisar(tx!);
        
        
      }
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar(title: Text('Busca de usuários')),
      drawer: MenuLateral(),
      body: Padding
      (
        padding: const EdgeInsets.all(8.0),
        child: Column
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
              onChanged: _buscar,
            ),
            const SizedBox(height: 10),
            Expanded
            (
              child: _gerUsuarios.build(context),
            ),

          ],
        ),
      ),
         
    );
    
           
  }

}