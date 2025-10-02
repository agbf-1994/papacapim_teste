import 'package:flutter/material.dart';

class NovaPostagem extends StatefulWidget
{
  const NovaPostagem({super.key, required this.novoPost});

  @override
  State<NovaPostagem> createState() => _NovaPostagemState();

  final Function(String) novoPost;

}

class _NovaPostagemState extends State<NovaPostagem>
{

  final GlobalKey<FormState> _novaPostagemKey = GlobalKey<FormState>();

  final TextEditingController _textoPostagemController = TextEditingController();

  @override
  void dispose()
  {
    _textoPostagemController.dispose();
    super.dispose();
  }

  void postar(String? tx)
  {
    setState(
      () {
        widget.novoPost(tx!);
        
      }
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar(title: Text('Nova postagem')),
      body: ListView
      (
        children: 
        [
          Form
          (
            key: _novaPostagemKey,
            child: Padding
            (
              padding: const EdgeInsets.all(8.0),
              child: Column
              (
                spacing: 12.0,
                children: 
                [
                  TextFormField
                  (
                    controller: _textoPostagemController,
                    decoration: const InputDecoration
                    (
                      labelText: "Vamos lá!",
                      border: OutlineInputBorder(),
                    ),
                    validator: (valor)
                    {
                      if(valor==null || valor.isEmpty)
                      {
                        return "Não tenha medo, escreva!";
                      }
                      return null;
                    }
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton
                    (
                      onPressed: () 
                      {
                        if(_novaPostagemKey.currentState!.validate())
                        {
                          _novaPostagemKey.currentState!.save();
                          postar(_textoPostagemController.text);

                        }      
                      },
                        
                      child: Text('Postar'),
                    ),
                ],
              )
            ),
          ),
        ],
      )
    );
  }
}