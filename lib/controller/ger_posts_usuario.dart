import 'package:flutter/material.dart';

import '../model/post.dart';
import 'api_service/api_acesso.dart';
import 'api_service/api_principal.dart';
import 'curtir_post.dart';
import 'excluir_curtida.dart';
import 'excluir_post.dart';
import 'mostrar_curtidas.dart';
import 'mostrar_respostas_post.dart';
import 'repository/repo_usuario.dart';
import 'responder_post.dart';

class GerPostsUsuario extends ChangeNotifier
{
  final RepoUsuario _listaPostsUsuario = RepoUsuario(ApiPrincipal(), ApiAcesso());
  late Future<List<Post>> _postsUsuario = _listaPostsUsuario.getMeusPosts(0);

  void sortear(int? p)
  {
    _postsUsuario = _listaPostsUsuario.getMeusPosts(p);
    notifyListeners();

  }

  void atualizar()
  {
    _postsUsuario = _listaPostsUsuario.getMeusPosts(0);
    notifyListeners();
  }

  Widget build(BuildContext context) 
  {
    return FutureBuilder
        (
          future: _postsUsuario, 
          builder: (context, snapshot)
          {
            
            if(snapshot.hasData)
            {
              if(snapshot.data!.isEmpty)
              {
                return Center
                (
                  child: Text("Sem postagens"),
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
                              ExcluirPost(postAExcluir: p.id,)

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
class GerPostsUsuario extends StatefulWidget 
{
  const GerPostsUsuario({super.key});

  @override
  State<StatefulWidget> createState() => _GerPostsUsuarioState();
}


class _GerPostsUsuarioState extends State<GerPostsUsuario> 
{
  final RepoUsuario _listaPostsUsuario = RepoUsuario(ApiPrincipal(), ApiAcesso());
  late Future<List<Post>> _postsUsuario;

  @override
  void initState()
  {
    super.initState();
    _postsUsuario = _listaPostsUsuario.getMeusPosts();
  }

  @override
  
  Widget build(BuildContext context) 
  {
    return FutureBuilder
        (
          future: _postsUsuario, 
          builder: (context, snapshot)
          {
            
            if(snapshot.hasData)
            {
              if(snapshot.data!.isEmpty)
              {
                return Center
                (
                  child: Text("Sem postagens"),
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
                              MostrarCurtidas(indiceCurtidaPost: p.id,),
                              ResponderPost(indiceRespostaPost:p.id,),
                              MostrarRespostasPost(indiceRespostaPost: p.id,),
                              ExcluirPost(postAExcluir: p.id,)

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