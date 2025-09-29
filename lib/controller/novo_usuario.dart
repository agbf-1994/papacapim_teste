//import 'dart:convert';

import 'package:flutter/material.dart';

import '../model/usuario.dart';
import '../view/tela_cadastro_usuario.dart';
import 'api_service/api_acesso.dart';
import 'api_service/api_principal.dart';
import 'repository/repo_usuario.dart';

class NovoUsuario extends StatefulWidget
{

  const NovoUsuario({super.key});

  @override
  State<NovoUsuario> createState() => _NovoUsuarioState();
  //State<StatefulWidget> createState() => _NovoUsuarioState();

}

class _NovoUsuarioState extends State<NovoUsuario>
{
  final RepoUsuario _repositorioUsuarios = RepoUsuario(ApiPrincipal(), ApiAcesso());

  void _novoUsuario(String u, String n, String s, String rs) async
  {
    try
    {
      setState
      (
        () 
        async {
          Usuario novo = Usuario(login: u, name: n, password: s, passwordConfirmation: rs);
          await _repositorioUsuarios.cadastrarUsuario(novo);
        }
      );
      
    }
    catch(e)
    {
      AlertDialog(title: Text(e.toString()));
    }

  }

  @override
  Widget build(BuildContext context)
  {
    return ElevatedButton
    (
      child: const Text('Não está cadastrado?'),
      onPressed: () 
      {
        Navigator.push
        (
          context,
          MaterialPageRoute
          (
            //Vai para o cadastro de usuário 
            builder: (context) => CadastroUsuario(novoUsuario: _novoUsuario,) 
          )
        );
        
      },
      
    );
  }
}