import 'package:flutter/material.dart';

import '../model/post.dart';
import 'api_service/api_acesso.dart';
import 'api_service/api_principal.dart';
import 'curtir_post.dart';
import 'excluir_curtida.dart';
import 'mostrar_curtidas.dart';
import 'mostrar_respostas_post.dart';
import 'repository/repo_usuario.dart';
import 'responder_post.dart';

class GerFeedUsuario extends ChangeNotifier
{
  final RepoUsuario _repositorioPosts = RepoUsuario(ApiPrincipal(), ApiAcesso());
  late Future<List<Post>> _posts = _repositorioPosts.getPosts(null, null, null);

  void sortear(String? s, int? p, int? f)
  {
    _posts = _repositorioPosts.getPosts(s, p, f);
    notifyListeners();

  }

  void atualizar()
  {
    _posts = _repositorioPosts.getPosts(null, null, null);
    notifyListeners();
  }

  Widget build(BuildContext context) 
  {
    return FutureBuilder
        (
          future: _posts, 
          builder: (context, snapshot)
          {
            
            if(snapshot.hasData)
            {
              if(snapshot.data!.isEmpty)
              {
                return Center
                (
                  child: Text("Está tudo vazio, por enquanto..."),
                );
              }
              else
              {
                return ListView
                (
                  children: 
                  [
                    for (var p in snapshot.data!)
                    if(p.idPost==null)
                    Card(
                      child: ListBody
                      (
                        children: 
                        [
                          ListTile(
                            title: Text(p.usrLogin),
                            subtitle: Text(p.message),
                            trailing: Text(
                              'Criado em ${p.dataCriacao}\nAtualizado em ${p.dataAtualizacao}',
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          Row
                          (
                            spacing: 12.0,
                          
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: 
                            [
                              Curtir(curtido: p.id,),
                              ExcluirCurtida(curtidaAExcluir: p.id,),
                              MostrarCurtidas(indiceCurtidaPost: p.id,),
                              ResponderPost(indiceRespostaPost:p.id,),
                              MostrarRespostasPost(indiceRespostaPost: p.id,),

                            ],
                          ),
                          SizedBox(height: 10.0,),


                        ],
                      ) 
                    ),
                  ],
                );

              }
              
              

            }
            
            else if(snapshot.hasError)
            {
              return const Center
              (
                child: Text('Erro de carregamento'),
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

/*
class GerFeedUsuario extends StatefulWidget
{
  const GerFeedUsuario({super.key});
  
  @override
  State<GerFeedUsuario> createState() => _GerFeedUsuarioState();

}

class _GerFeedUsuarioState extends State<GerFeedUsuario>
{
  final RepoUsuario _repositorioPosts = RepoUsuario(ApiPrincipal(), ApiAcesso());
  late Future<List<Post>> _posts;

  @override
  void initState()
  {
    super.initState();
    _posts = _repositorioPosts.getPosts("", 0, 0);
  }
  

  @override
  Widget build(BuildContext context) 
  {
    return FutureBuilder
        (
          future: _posts, 
          builder: (context, snapshot)
          {
            
            if(snapshot.hasData)
            {
              if(snapshot.data!.isEmpty)
              {
                return Center
                (
                  child: Text("Está tudo vazio, por enquanto..."),
                );
              }
              else
              {
                return ListView
                (
                  children: 
                  [
                    for (var p in snapshot.data!)
                    if(p.idPost==null)
                    Card(
                      child: ListBody
                      (
                        children: 
                        [
                          ListTile(
                            title: Text(p.usrLogin),
                            subtitle: Text(p.message),
                            trailing: Text(
                              'Criado em ${p.dataCriacao}\nAtualizado em ${p.dataAtualizacao}',
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          Row
                          (
                            spacing: 12.0,
                          
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: 
                            [
                              Curtir(curtido: p.id,),
                              ExcluirCurtida(curtidaAExcluir: p.id,),
                              MostrarCurtidas(indiceCurtidaPost: p.id,),
                              ResponderPost(indiceRespostaPost:p.id,),
                              MostrarRespostasPost(indiceRespostaPost: p.id,),

                            ],
                          ),
                          SizedBox(height: 10.0,),


                        ],
                      ) 
                    ),
                  ],
                );

              }
              
              

            }
            
            else if(snapshot.hasError)
            {
              return const Center
              (
                child: Text('Erro de carregamento'),
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
*/