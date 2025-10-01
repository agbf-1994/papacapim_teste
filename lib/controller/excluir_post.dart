import 'package:flutter/material.dart';


import '../view/tela_perfil.dart';
import 'api_service/api_acesso.dart';
import 'api_service/api_principal.dart';
import 'mostrar_alerta.dart';
import 'repository/repo_usuario.dart';

class ExcluirPost extends StatefulWidget
{
  const ExcluirPost({super.key, required this.postAExcluir});

  @override
  State<StatefulWidget> createState() => _ExcluirPostState();
  final int postAExcluir;
}

class _ExcluirPostState extends State<ExcluirPost>
{
  final RepoUsuario _repositorioPosts = RepoUsuario(ApiPrincipal(), ApiAcesso());
  //late Future<Post> _post;

  Future<void> _excluirPost(int pe)
  async {
    try
    {
      await _repositorioPosts.excluirPost(pe);
      if(mounted)
      {
        setState
        (
          () 
          {
            mostrarAlerta(context, "Post excluído!");
            Navigator.push
              (
                context,
                MaterialPageRoute(
                builder: (builder) => Perfil(),
                )
              );
        
          }
        );

      }

    }
    catch(e)
    {
      mostrarAlerta(context, e.toString());

    }
    
    
  }


  @override
  Widget build(BuildContext context) 
  {
    return ElevatedButton
    (
      onPressed: () 
      {
        _excluirPost(widget.postAExcluir);
                                        
      },
      child: const Icon(Icons.folder_delete_outlined),
    );
    
  }
}