import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../view/tela_feed_usuario.dart';
import 'autenticacao.dart';
import 'ger_token_sessao.dart';

class Inicializacao extends StatefulWidget 
{
  const Inicializacao({super.key});

  @override
  State<Inicializacao> createState() => _InicializacaoState();
}

class _InicializacaoState extends State<Inicializacao>
{
  @override
  void initState()
  {
    super.initState();
    _iniciar();

  }

  void _iniciar() async
  {
    await Future.delayed(const Duration(seconds: 1));
    String? token = await getToken();

    if(mounted)
    {
      if(token!=null)
      {
        Navigator.pushReplacement
        (
          context,
          MaterialPageRoute
          (
            builder: (_) => const FeedUsuario(),
          ),
        );
        
      }
      else
      {
        
        Navigator.pushReplacement
        (
          context,
          MaterialPageRoute
          (
            builder: (_) => Autenticacao(),
          ),
        );

      }
    }
  }
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp
    (
      home: Scaffold
      (

        body: Center
        (
          child: CircularProgressIndicator(),
        )
      )
    );
  }
  
}