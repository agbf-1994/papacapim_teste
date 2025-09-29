import 'package:flutter/material.dart';

void mostrarAlerta(BuildContext context, String msg)
{
  showDialog
  (
    context: context, 
    builder: (BuildContext context)
    {
      return AlertDialog
      (
        title: Text("Informação"),
        content: Text(msg),
        actions: 
        [
          TextButton
          (
            onPressed: 
            ()
            {
              Navigator.of(context).pop();
            }, 
            child: Text("OK")
          )
        ],
      );
    }
  );
}