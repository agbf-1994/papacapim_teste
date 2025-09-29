import 'package:flutter/material.dart';

import '../controller/retornar_login.dart';

class TelaRedirLogin extends StatelessWidget
{
  const TelaRedirLogin({super.key});
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      body: Center
      (
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: 
          [
            const Text('O login será reiniciado. Para sua segurança, anote'),
            const Text('a sua senha em um lugar seguro.'),
            const SizedBox(height: 10.0,),
            RetornarLogin(),
          ],

        ),
        

      ),
    );
  }
  
}