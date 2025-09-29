import 'package:flutter/material.dart';

import '../model/sessao.dart';
import 'api_service/api_acesso.dart';
import 'api_service/api_principal.dart';
import 'autenticacao.dart';
import 'repository/repo_usuario.dart';

class Sair extends StatefulWidget
{
  const Sair({super.key});

  @override
  State<StatefulWidget> createState() => _SairState();
}

class _SairState extends State<Sair>
{
  final RepoUsuario _repositorioSessao = RepoUsuario(ApiPrincipal(), ApiAcesso());
  late Future<List<Sessao>> _sessao;

  @override
  void initState()
  {
    super.initState();
    _sessao = _repositorioSessao.getSessoes();
  }

  Future<void> apagar()
  async {
    await _repositorioSessao.apagarSessaoAtual();
    if(mounted)
    {
      setState
      (
        ()
        {
            Navigator.pushReplacement
            (
              context,
              MaterialPageRoute(
              builder: (builder) => Autenticacao(),
            )
            );
          
        }
      );

    }
    
  }

  Widget build(BuildContext context) 
  {
    return FutureBuilder
        (
          future: _sessao, 
          builder: (context, snapshot)
          {
            
            if(snapshot.hasData)
            {
              return ElevatedButton
              (
                child: const Text('Sair'),
                onPressed: () 
                {
                  apagar();
                  
                },
              );
            }
            else if(snapshot.hasError)
            {
              return const Center
              (
                child: Text("Sessão inválida"),
              );
            }
            else
            {
              return const Center(child: CircularProgressIndicator());

            }
          },
         
        );
    
    
  }

  /*
  @override
  Widget build(BuildContext context) 
  {
    return FutureBuilder
        (
          future: _sessao, 
          builder: (context, snapshot)
          {
            
            if(snapshot.hasData)
            {
              return ElevatedButton
              (
                child: const Text('Sair'),
                onPressed: () 
                {
                  apagar();
                  
                },
              );
            }
            else if(snapshot.hasError)
            {
              return const Center
              (
                child: Text("Sessão inválida"),
              );
            }
            else
            {
              return const Center(child: CircularProgressIndicator());

            }
          },
         
        );
    
    
  }
  */
}