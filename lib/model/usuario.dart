

class Usuario
{
  String? login, name, password, passwordConfirmation; 

  Usuario
  (
    {
      required this.login,
      required this.name,
      required this.password,
      required this.passwordConfirmation,
    }

  );

  
  
  @override
  Usuario.atualizar
  (
    this.login,
    this.name,
    this.password,
    this.passwordConfirmation,
  );

  Map<String,dynamic> toJson()
  {
    if((login==null) && (name==null) && (password==null) && (passwordConfirmation==null))
    {
      return 
      {
        "user":
        {
        }

      };
      
    }
    else if((name==null) && (password==null) && (passwordConfirmation==null))
    {
      return 
      {
        "user":
        {
          "login": login,
        }

      };

    }
    else if((login==null) && (password==null) && (passwordConfirmation==null))
    {
      return 
      {
        "user":
        {
          "name": name,
        }

      };
    }
    else if((password==null) && (passwordConfirmation==null))
    {
      return 
      {
        "user":
        {
          "login": login,
          "name": name,   
        }

      };

    }
    else if((password==null) || (passwordConfirmation==null))
    {
      return 
      {
        "user":
        {
          "login": login,
          "name": name,   
        }

      };

    }
    else if((login==null) && (name==null))
    {
      return
      {
        "user":
        {
          "password": password,
          "password_confirmation": passwordConfirmation
        }
      };

    }
    else if(login==null)
    {
      return
      {
        "user":
        {
          "name": name,
          "password": password,
          "password_confirmation": passwordConfirmation
        }
      };

    }
    else if(name==null)
    {
      return
      {
        "user":
        {
          "login": login,
          "password": password,
          "password_confirmation": passwordConfirmation
        }
      };

    }
    
    else
    {
      return
      {
        "user":
        {
          "login": login,
          "name": name,
          "password": password,
          "password_confirmation": passwordConfirmation
        }
      };

    }
  }
  
  /*
  Map<String,dynamic> toJson() =>
  {
    "user":
    {
      "login": login,
      "name": name,
      "password": password,
      "password_confirmation": passwordConfirmation
    }

  };
  */
  


}

class UsuarioConta
{
  final String login, name, creationDate, updateDate;
  //final int id;

  UsuarioConta
  (
    {
      //required this.id,
      required this.login,
      required this.name,
      required this.creationDate,
      required this.updateDate
    }
  );

  factory UsuarioConta.fromJson(Map<String,dynamic> json) => UsuarioConta
  (
    //id: json['id'],
    login: json["login"],
    name: json["name"],
    creationDate: json["created_at"],
    updateDate: json["updated_at"],

  );

}

class Seguidor
{
  final String nomeSeg, nome, dataCriacao, dataAtualizacao;
  final int idSeg, idUser;

  Seguidor
  (
    {
      required this.idSeg,
      required this.nomeSeg,
      required this.idUser,
      required this.nome,
      required this.dataCriacao,
      required this.dataAtualizacao
    }

  );

  factory Seguidor.fromJson(Map<String,dynamic> json) => Seguidor
  (
    idSeg: json["follower_id"], 
    nomeSeg: json["follower_login"], 
    idUser: json["followed_id"], 
    nome: json["followed_login"], 
    dataCriacao: json["created_at"], 
    dataAtualizacao: json["updated_at"]
  );
}