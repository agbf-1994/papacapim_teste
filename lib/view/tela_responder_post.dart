import 'package:flutter/material.dart';

class ResponderPostagem extends StatefulWidget
{
  const ResponderPostagem({super.key, required this.responderPost});

  @override
  State<ResponderPostagem> createState() => _ResponderPostagemState();
  
  final Function(String,int) responderPost;

}

class _ResponderPostagemState extends State<ResponderPostagem>
{

  final GlobalKey<FormState> _respostaKey = GlobalKey<FormState>();

  final TextEditingController _textoPostagemController = TextEditingController();

  @override
  void dispose()
  {
    _textoPostagemController.dispose();
    super.dispose();
  }

  void responder(String? tx)
  {
    setState(
      () {
        widget.responderPost(tx!, 0);
        
      }
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar(title: Text('Responder...')),
      body: ListView
      (
        children: 
        [
          Form
          (
            key: _respostaKey,
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
                        if(_respostaKey.currentState!.validate())
                        {
                          _respostaKey.currentState!.save();
                          responder(_textoPostagemController.text, );

                        }      
                      },
                        
                      child: Text('Responder'),
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