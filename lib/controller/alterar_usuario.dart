
import 'package:flutter/material.dart';

//import '../model/usuario.dart';
//import '../view/tela_alteracao_usuario.dart';
//import '../view/tela_sessao.dart';
//import '../model/usuario.dart';
import '../model/usuario.dart';
import '../view/tela_alteracao_usuario.dart';
import '../view/tela_redir_login.dart';
import 'api_service/api_acesso.dart';
import 'api_service/api_principal.dart';
import 'repository/repo_usuario.dart';
import 'verificar_dados.dart';

class AlterarUsuario extends StatefulWidget
{

  const AlterarUsuario({super.key});

  @override
  //State<AlterarUsuario> createState() => _AlterarUsuarioState();
  State<StatefulWidget> createState() => _AlterarUsuarioState();

}

class _AlterarUsuarioState extends State<AlterarUsuario>
{
  final RepoUsuario _repositorioUsuarios = RepoUsuario(ApiPrincipal(), ApiAcesso());
  
  void _alterar(String? u, String? n, String? s, String? rs)
  async 
  {
    bool confirmar = false;
    bool senhaEditada = false;
    try
    {
      if(u=='') u=null;
      if(n=='') n=null;
      if(s=='') s=null;
      if(rs=='') rs=null;

      if((s!=null) || (rs!=null))
      {
        if(senhaIdeal(s!, rs!))
        {
          confirmar = true;
          senhaEditada = true;
        }
        else
        {
          confirmar = false;
          s=null;
          rs=null;
        }
      }
      else
      {
        confirmar = true;
        senhaEditada = false;
      }
      
      if(confirmar)
      {
        Usuario usr  = Usuario.atualizar(u, n, s, rs);
      
        await _repositorioUsuarios.alterarUsuario(usr);
        if(senhaEditada)
        {
          if(mounted)
          {
            setState
            (
              () 
              async {
                
                Navigator.push
                (
                  context, 
                  MaterialPageRoute
                  (
                    builder: (context) => TelaRedirLogin(),
                  )
                );
              
              }
            );

          }

        }
        else if(!senhaEditada)
        { 
          if(mounted)
          {
            setState
            (
              () 
              async {
                
                Navigator.pop(context);
              }
            );

          }

        }
        
        
        /*
        setState
        (
          () 
          async 
          {
            Usuario usr  = Usuario.atualizar(u, n, s, rs);
            
            await _repositorioUsuarios.alterarUsuario(usr);

            if(senhaEditada)
            {
              if(mounted)
              {
                Navigator.pushReplacement
                (
                  context, 
                  MaterialPageRoute
                  (
                    builder: (context) => TelaRedirLogin(),
                  )
                );

              }

            }
            else
            {
              if(mounted)
              {
                Navigator.pop(context);

              }
            }

          }
        );
      */  
      }
      
      else if(!confirmar)
      {
        print('dados inválidos');
      }

      /* 
      Usuario usr  = Usuario.atualizar(u, n, s, rs);
      setState
      (
        () 
        async {
          
          await _repositorioUsuarios.alterarUsuario(usr);
        }
      );
      */
      
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
      child: const Text('Alterar dados'),
      onPressed: () 
      {
        
        Navigator.push
        (
          context,
          MaterialPageRoute
          (
            //Vai para o cadastro de usuário 
            builder: (context) => AlteracaoUsuario(alterarUsuario: _alterar,)
          )
        );
        
        
      },
      
    );
  }
}