class Sessao 
{
  late String usrLogin, token, dataCriacao, dataAtualizacao;
  late int  id;
  Sessao
  ( 
    {
      required this.id,
      required this.usrLogin,
      required this.token,
      required this.dataCriacao,
      required this.dataAtualizacao
    }

  );

  String mostrar()
  {
    return 'ID: $id, Login: $usrLogin, Token: $token, Criado em: $dataCriacao, Atualizado em: $dataAtualizacao';
  }

  factory Sessao.fromJson(Map<String,dynamic> json) => Sessao
  (
    id: json["id"],
    usrLogin: json["user_login"],
    token: json["token"], 
    dataCriacao: json["created_at"],
    dataAtualizacao: json["updated_at"]
  );
}

class SessaoAtivado
{
  late String login, password;

  SessaoAtivado
  (
    {
      required this.login,
      required this.password
    }
  );

  Map<String,dynamic> toJson() => 
  {
    "login": login,
    "password": password
  };
}