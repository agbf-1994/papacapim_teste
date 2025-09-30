

import 'package:flutter/material.dart';
import 'package:papacapim_v02/controller/mostrar_alerta.dart';


import '../model/sessao.dart';
import '../view/tela_feed_usuario.dart';
import '../view/tela_login.dart';
import 'api_service/api_acesso.dart';
import 'api_service/api_principal.dart';
import 'ger_token_sessao.dart';
import 'repository/repo_usuario.dart';
import 'verificar_dados.dart';


class Autenticacao extends StatefulWidget
{

  const Autenticacao({super.key});

  @override
  State<Autenticacao> createState() => _AutenticacaoState();

}

class _AutenticacaoState extends State<Autenticacao>
{
  final RepoUsuario _repositorioUsuarios = RepoUsuario(ApiPrincipal(), ApiAcesso());
  
  late Sessao _usuarioLogado;
  late String? token;

  
  @override
  void initState()
  {
    super.initState();

  }

  void _logar(String u, String s) async
  {

    if((senhaLoginIdeal(s)) && (!loginUserVazio(u)))
    {
      SessaoAtivado novaSessao = SessaoAtivado(login: u, password: s);
      _usuarioLogado = await _repositorioUsuarios.iniciarSessao(novaSessao);
      salvarToken(_usuarioLogado.token);
      salvarUsername(_usuarioLogado.usrLogin);

      if(mounted)
      {
        
        setState
        (
          () 
          {
            Navigator.pushReplacement
            (
              context,
              MaterialPageRoute
              (
                //Vai para a tela principal de usuário 
                builder: (context) => FeedUsuario()
                //builder: (context) => TelaPrincipal(),
              )
            );

          
          }
        );
      }
      

      

      
      
      
      

    }
    else if(!senhaLoginIdeal(s))
    {
      mostrarAlerta(context, "A senha não se encaixa nos padrões de seguranca.\nTente novamente.");
    }
    
    
  }
  @override
  Widget build(BuildContext context) 
  {
    //redirecionar();

    return MaterialApp
    (
      home: Scaffold
      (
        body: Login(logar: _logar,)
        /*
        body: Center
        (
          child: const CircularProgressIndicator(),
        )
        */
        
      )
    );
  }

}

