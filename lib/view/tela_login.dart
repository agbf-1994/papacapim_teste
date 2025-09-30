import 'package:flutter/material.dart';

import '../controller/novo_usuario.dart';


class Login extends StatefulWidget
{
  const Login({super.key, required this.logar});

  @override
  State<Login> createState() => _LoginState();
  final Function(String,String) logar;
}

class _LoginState extends State<Login>
{
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  void dispose()
  {
    _usuarioController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  void logar(String? u, String? s){

    setState
    (
      () 
      {
        widget.logar(u!, s!);
        
      }
    );

  }


  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar(title: const Text('Login do Papacapim')),
      body: Form
            (
              key: _loginKey,
              child: Padding
              (
                padding: const EdgeInsets.all(8.0),
                child: Column
                (
                  spacing: 12.0,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:
                  [
                    TextFormField
                    (
                      controller: _usuarioController,
                      decoration: const InputDecoration
                      (
                        labelText: "Usuário: ",
                        border: OutlineInputBorder(),
                      ),
                      validator: (valor)
                      {
                        if(valor == null || valor.isEmpty)
                        {
                          return 'Usuário obrigatório!';
                        }
                        return null;
                      },
                    ),

                    TextFormField
                    (
                      controller: _senhaController,
                      decoration: const InputDecoration
                      (
                        labelText: "Senha: ",
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      validator: (valor)
                      {
                        if(valor == null || valor.isEmpty)
                        {
                          return 'Senha obrigatória!';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 10),

                    
                    ElevatedButton
                      (
                        onPressed: () 
                        {
                          if(_loginKey.currentState!.validate())
                          {
                            _loginKey.currentState!.save();
                            
                            logar(_usuarioController.text, _senhaController.text);
                          }
                          else
                          {
                            return;
                          }
                          

                        },
                        child: const Text('Entrar'),
                      ),

                    //Função de cadastro de novo usuário
                    NovoUsuario(),
                  ]            

                ),
              ), 
            )
          

    );
  }

}
