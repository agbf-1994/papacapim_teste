import 'package:flutter/material.dart';
import '../model/sessao.dart';
import '../view/tela_sessao.dart';
import 'api_service/api_acesso.dart';
import 'api_service/api_principal.dart';
import 'autenticacao.dart';
import 'repository/repo_usuario.dart';

class GerSessao extends StatefulWidget
{
  const GerSessao({super.key});

  @override
  State<GerSessao> createState() => _GerSessaoState();
  //State<StatefulWidget> createState() => _GerSessaoState();
  
}

class _GerSessaoState extends State<GerSessao>
{
  final RepoUsuario _repositorioSessoes = RepoUsuario(ApiPrincipal(), ApiAcesso());

  late Future<List<Sessao>> _sessoes;
  @override
  void initState()
  {
    super.initState();
    _sessoes = _repositorioSessoes.getSessoes();
  }

  Future<void> apagar(int a)
  async {
    await _repositorioSessoes.apagarSessao(a);
    setState
    (
      ()
      {
        if(mounted)
        {
          Navigator.pushReplacement
          (
            context,
            MaterialPageRoute(
            builder: (builder) => TelaSessao(),
          )
          );
        }
        
      }
    );

  }


  

  @override
  Widget build(BuildContext context) 
  {
    return FutureBuilder
        (
          future: _sessoes, 
          builder: (context, snapshot)
          {
            
            if(snapshot.hasData)
            {
              return ListView
              (
                children: 
                [
                  for (var s in snapshot.data!)
                  Card(
                    child: ListBody
                    (
                      children: 
                      [
                        ListTile
                        (
                        title: Text(s.usrLogin),
                        trailing: Text(s.dataCriacao),
                        
                        ),
                        SizedBox(height: 10.0,),
                Row
                (
                  spacing: 12.0,
                
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: 
                  [
                    
                    ElevatedButton
                    (
                      onPressed: () 
                      {
                        apagar(s.id);
                                      
                      },
                      child: const Icon(Icons.recycling)
                    ),
                  ],
                ),
                SizedBox
                (
                  height: 10.0,

                ),

                      ],
                    ),
                  ),
                  
                ],
              );

            }
            
            else if(snapshot.hasError)
            {
              return Column
              (
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: 
                [
                  const Text("Erro de requisição"),
                  SizedBox(height: 10.0,),
                  ElevatedButton
                  (
                    onPressed: 
                    ()
                    {
                      setState
                      (
                        () 
                        {
                          Navigator.push
                          (
                            context, 
                            MaterialPageRoute
                            (
                              builder: (context) => Autenticacao(),
                            )
                          );
                        }
                      );
                    }, 
                    child: const Text("Voltar ao login"),
                  ),
                ]
              );

            }
            else
            {
              return const Center(child: CircularProgressIndicator());

            }
          },
        );
  }
  
}