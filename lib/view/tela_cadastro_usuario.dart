import 'package:flutter/material.dart';

import '../controller/verificar_dados.dart';

class CadastroUsuario extends StatefulWidget 
{
  const CadastroUsuario({super.key, required this.novoUsuario});

  @override
  State<CadastroUsuario> createState() => _CadastroUsuarioState();
  final Function(String,String,String,String) novoUsuario;
}

class _CadastroUsuarioState extends State<CadastroUsuario>
{
  final GlobalKey<FormState> _cadastroUsuarioKey = GlobalKey<FormState>();

  final TextEditingController _usuarioCadController = TextEditingController();
  final TextEditingController _nomeCadController = TextEditingController();
  final TextEditingController _senhaCadController = TextEditingController();
  String? _infoCadastro;
  
  String? _cs;

  @override
  void dispose()
  {
    _usuarioCadController.dispose();
    _nomeCadController.dispose();
    _senhaCadController.dispose();
    super.dispose();
  }

  void cadastrar(String? u, String? n, String? s, String? rs){
    
    setState
    (
      () 
      {
        if(senhaIgual(s!, rs!))
        {
          widget.novoUsuario(u!, n!, s, rs);
          Navigator.pop(context);

        }
        else
        {
          _infoCadastro = 'As senhas devem coincidir!';

        }
      
      }
    );
   
  }

  

  @override
  Widget build(BuildContext context)
  {
    
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text('Bem-vindo ao Papacapim!'),
      ),
      body: Container
      (
        
        padding: EdgeInsets.all(8.0),

        child: Form
        (
          key: _cadastroUsuarioKey,
          child: Column
          (
            
            spacing: 12.0,
            children: 
            [
              TextFormField
              (
                controller: _usuarioCadController,
                decoration: const InputDecoration
                (
                  labelText: "Usuário: ",
                  border: OutlineInputBorder(),
                ),
                validator: (valor)
                {
                  if(valor == null || valor.isEmpty)
                  {
                    return 'Favor digitar o seu nome de usuário!';
                  }
                  return null;
                },
              ),
              TextFormField
              (
                controller: _nomeCadController,
                decoration: const InputDecoration
                (
                  labelText: "Nome completo: ",
                  border: OutlineInputBorder(),
                ),
                      
                validator: (valor)
                {
                  if(valor == null || valor.isEmpty)
                  {
                    return 'Favor digitar o seu nomecompleto!';
                  }
                  return null;
                },
              ),
              TextFormField
              (
                controller: _senhaCadController,
                decoration: const InputDecoration
                (
                  labelText: "Senha: ",
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (valor)
                {
                  if(valor == null || valor.isEmpty)
                  {
                    return 'Favor digitar a sua senha!';
                  }
                  return null;
                },
              ),
              TextFormField
              (
                decoration: const InputDecoration
                (
                  labelText: "Confirme a sua senha: ",
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (valor)
                {
                  if(valor == null || valor.isEmpty)
                  {
                    return 'Favor confirmar a sua senha!';
                  }
                  return null;
                },
                onSaved: (valor) => setState
                (
                  () => _cs = valor
                ),
              ),
              const SizedBox(height: 10),
              
              if(_infoCadastro!=null)
                Padding
                (
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(_infoCadastro!),
                ),

              ElevatedButton
              (
                onPressed: () 
                {
                  if(_cadastroUsuarioKey.currentState!.validate())
                  {
                    _cadastroUsuarioKey.currentState!.save();
                    cadastrar(_usuarioCadController.text, _nomeCadController.text, _senhaCadController.text, _cs!);

                  }
                  
                },
                  
                child: Text('Cadastrar'),
              ),
            ],
          )
        ),
      )

    );
  }
}