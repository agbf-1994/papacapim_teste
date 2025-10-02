import 'package:flutter/material.dart';
import 'package:papacapim_v02/controller/mostrar_alerta.dart';

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


  Future<void> apagar(int a)
  async {
    try
    {
      await _repositorioSessao.apagarSessao(a);
      
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
    catch(e)
    {
      mostrarAlerta(context, e.toString());
    }
    
  }

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
              if(snapshot.data!.length==1)
              {
                return ElevatedButton
                (
                  child: const Text('Sair'),
                  onPressed: () 
                  {
                    apagar(snapshot.data!.first.id);
                    
                  },
                );


              }
              else
              {
                return ElevatedButton
                (
                  child: const Text('Você tem sessões em aberto.'),
                  onPressed: () 
                  {
                    
                    
                  },
                );
              }
              
              
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
          }
         
        );
    
    
  }

}