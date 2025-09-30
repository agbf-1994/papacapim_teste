import 'package:flutter/material.dart';
//import '../model/sessao.dart';
//import '../model/sessao.dart';
//import '../model/usuario.dart';
import '../model/usuario.dart';
import 'alterar_usuario.dart';
//import 'api_service/api_acesso.dart';
//import 'api_service/api_principal.dart';
//import 'autenticacao.dart';
//import 'ger_token_sessao.dart';
//import 'mostrar_seguidores.dart';
//import 'repository/repo_usuario.dart';
import 'api_service/api_acesso.dart';
import 'api_service/api_principal.dart';
import 'ger_posts_usuario.dart';
import 'mostrar_seguidores.dart';
import 'repository/repo_usuario.dart';
import 'sair.dart';

class ContPerfil extends StatefulWidget
{
  const ContPerfil({super.key});

  @override
  State<ContPerfil> createState() => _ContPerfilState();
  //State<StatefulWidget> createState() => _ContPerfilState();

}

class _ContPerfilState extends State<ContPerfil> 
{
  final RepoUsuario _repositorioUsuarios = RepoUsuario(ApiPrincipal(), ApiAcesso());
  late Future<UsuarioConta> _usuario;

  final GerPostsUsuario _gerPostsUsuario = GerPostsUsuario();

  int _pagina = 0;


  
  @override
  void initState()
  {
    super.initState();
    _usuario = _repositorioUsuarios.getUsuario();

   
  }

  void _paginar(int? p)
  {
    setState
    (
      () 
      {
        _gerPostsUsuario.sortear(p);
      }
    );
  }
   
  void _atualizar()
  {
    setState
    (
      () 
      {
        _gerPostsUsuario.atualizar();
      }
    );
  }

  
  @override
  Widget build(BuildContext context) 
  {
    return FutureBuilder
    (
      //future: _perfilUsuario, 
      future: _usuario, 
      builder: (context, snapshot)
      {
        if(snapshot.hasData)
        {
          return Column
          (
            children: 
            [
              Card
                (
                  elevation: 10.0,
                  child: ListBody
                  (
                    
                    children: 
                    [
                      
                      ListTile
                      (
                        title: Text(snapshot.data!.login),
                        subtitle: Text(snapshot.data!.name),
                        //trailing: Text(snapshot.data!.id.toString()),
                        leading: Icon(Icons.person),

                      ),
                      SizedBox(height: 10.0,),
                      Column
                      (
                        spacing: 12.0,
                      
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,

                      ),
                      
                      SizedBox(height: 10.0,),
                      Row
                      (
                        spacing: 12.0,
                      
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: 
                        [
                          MostrarSeguidores(loginUsuario: snapshot.data!.login,), 
                          
                        ],
                      ),
                      SizedBox(height: 10.0,),
                      Row
                      (
                        spacing: 12.0,
                              
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: 
                        [
                          AlterarUsuario(),
                          Sair()

                        ],
                      ),
                      SizedBox(height: 10.0,),
                     
                    ]
                  )
                
                ),
                Column
                (
                  children: 
                  [
                    Card
                    (
                      child: ListBody
                      (
                        children: 
                        [
                          ListTile
                          (
                            title: Text("Minhas postagens"),
                          )
                        ],
                      )
                    )

                  ],
                ),
                Expanded
                (
                  child: _gerPostsUsuario.build(context),
                ),
                Card
                (
                  child: Row
                  (
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: 
                    [
                      IconButton
                      (
                        icon: Icon(Icons.arrow_back),
                        onPressed: 
                        ()
                        {
                          _paginar(_pagina--);

                        },
                      ),
                      IconButton
                      (
                        icon: Icon(Icons.update),
                        onPressed: 
                        ()
                        {
                          _atualizar();

                        },
                      ),
                      IconButton
                      (
                        icon: Icon(Icons.arrow_forward),
                        onPressed: 
                        ()
                        {
                          _paginar(_pagina++);

                        },
                      ),
                    ],
                  ),
                )
                

            ],
          );
            
                
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