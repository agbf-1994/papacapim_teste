import 'package:flutter/material.dart';


class AlteracaoUsuario extends StatefulWidget 
{
  const AlteracaoUsuario({super.key, required this.alterarUsuario});

  @override
  State<AlteracaoUsuario> createState() => _AlteracaoUsuarioState();
  final Function(String?,String?,String?,String?) alterarUsuario;
}

class _AlteracaoUsuarioState extends State<AlteracaoUsuario>
{
  final GlobalKey<FormState> _cadastroUsuarioKey = GlobalKey<FormState>();

  String? _u, _n, _s, _cs;


  void alterar(String? u, String? n, String? s, String? rs){
    
    
    setState
    (
      () 
      {
        
        widget.alterarUsuario(u, n, s, rs);
        

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
        title: Text('Alterar seus dados'),
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
                //controller: _usuarioCadController,
                decoration: const InputDecoration
                (
                  labelText: "Usuário: ",
                  border: OutlineInputBorder(),
                ),
                onSaved: (valor) => setState
                (
                  () => _u = valor
                ),
                
              ),
              TextFormField
              (
                //controller: _nomeCadController,
                decoration: const InputDecoration
                (
                  labelText: "Nome completo: ",
                  border: OutlineInputBorder(),
                ),
                onSaved: (valor) => setState
                (
                  () => _n = valor
                ),      
              ),
              TextFormField
              (
                //controller: _senhaCadController,
                decoration: const InputDecoration
                (
                  labelText: "Senha: ",
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                onSaved: (valor) => setState
                (
                  () => _s = valor
                ),
              ),
              TextFormField
              (
                decoration: const InputDecoration
                (
                  labelText: "Confirme a sua senha: ",
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                
                onSaved: (valor) => setState
                (
                  () => _cs = valor
                ),
              ),
              const SizedBox(height: 10),
              
              ElevatedButton
              (
                onPressed: () 
                {
                  if(_cadastroUsuarioKey.currentState!.validate())
                  {
                    _cadastroUsuarioKey.currentState!.save();
                    alterar(_u, _n, _s, _cs);

                  }
                  
                },
                  
                child: Text('Alterar'),
              ),
            ],
          )
        ),
      )

    );
  }
}