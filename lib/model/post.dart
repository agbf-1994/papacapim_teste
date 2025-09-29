class Post
{
  final String usrLogin, message, dataCriacao, dataAtualizacao;
  final int id; 
  int? idPost;
  Post({
    required this.id,
    required this.usrLogin,
    required this.idPost,
    required this.message,
    required this.dataCriacao,
    required this.dataAtualizacao,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post
  (
    id: json["id"],
    usrLogin: json["user_login"],
    idPost: json["post_id"],
    message: json["message"],
    dataCriacao: json["created_at"],
    dataAtualizacao: json["updated_at"],
  );

}

class PostNovo
{
  late String message;

  PostNovo({required this.message});

  Map<String, dynamic> toJson() => 
  {
    "post": {"message": message},
  };
}

class PostResposta
{
  late String message;

  PostResposta({required this.message});

  Map<String, dynamic> toJson() => 
  {
    "reply": {"message": message},
  };
}

class Curtida
{
  final String usrLogin, dataCriacao, dataAtualizacao;
  final int id, postId;

  Curtida
  (
    {
      required this.id,
      required this.usrLogin,
      required this.postId,
      required this.dataCriacao,
      required this.dataAtualizacao
    }
  );

  factory Curtida.fromJson(Map<String,dynamic> json) => Curtida
  (
    id: json["id"], 
    usrLogin: json["user_login"], 
    postId: json["post_id"], 
    dataCriacao: json["created_at"], 
    dataAtualizacao: json["updated_at"]
  );

}
