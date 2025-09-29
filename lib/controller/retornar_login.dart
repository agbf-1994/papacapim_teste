import 'package:flutter/material.dart';

import 'autenticacao.dart';


class RetornarLogin extends StatefulWidget
{
  const RetornarLogin({super.key});
  
  @override
  State<StatefulWidget> createState() => _RetornarLoginState();
}

class _RetornarLoginState extends State<RetornarLogin>
{
  @override
  Widget build(BuildContext context) 
  {
    return ElevatedButton
    (
      child: const Text('Voltar ao Papacapim'),
      onPressed: () 
      {
        Navigator.push
        (
          context,
          MaterialPageRoute
          (
            //Vai para o cadastro de usuário 
            builder: (context) => Autenticacao(),
          )
        );
        
      },
      
    );
  }
}