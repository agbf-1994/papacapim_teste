import '../../model/post.dart';
import '../../model/sessao.dart';
import '../../model/usuario.dart';
import '../api_service/api_acesso.dart';
import '../api_service/api_principal.dart';

class RepoUsuario 
{
  ApiPrincipal servicoApiUsuario;

  ApiAcesso servicoApiUsuarioPrivado;

  RepoUsuario(this.servicoApiUsuario, this.servicoApiUsuarioPrivado);

  //Respositórios para Usuários
  Future<List<UsuarioConta>> getUsuarios(int? p, String? s) async => servicoApiUsuarioPrivado.listarUsuarios(p, s);

  Future<UsuarioConta> getUsuario() async => servicoApiUsuarioPrivado.getUsuario();

  Future<UsuarioConta> cadastrarUsuario(Usuario usr) async => servicoApiUsuario.novoUsuario(usr);

  Future<List<UsuarioConta>> buscarUsuario(String nome) async => servicoApiUsuarioPrivado.buscarUsuario(nome);

  Future<UsuarioConta> alterarUsuario(Usuario um) async => servicoApiUsuarioPrivado.alterarUsuario(um);

  //Respositórios para Seguidores
  Future<Seguidor> seguirUsuario(String sg) async => servicoApiUsuarioPrivado.seguirUsuario(sg);

  Future<List<Seguidor>> listarSeguidores(String sg) async => servicoApiUsuarioPrivado.listarSeguidores(sg);

  Future<void> apagarSeguidor(int id, String sg) async => servicoApiUsuarioPrivado.apagarSeguidor(id, sg);

  //Respositórios para Postagens
  Future<List<Post>> getPosts(String? s, int? p, int? f) async => servicoApiUsuarioPrivado.listarPosts(s, p, f);

  Future<Post> postar(PostNovo ps) async => servicoApiUsuarioPrivado.novoPost(ps);

  Future<Post> responderPost(PostResposta rp, int cp) async => servicoApiUsuarioPrivado.responderPost(rp, cp);

  Future<List<Post>> getRespostas(int pr, int? p) async => servicoApiUsuarioPrivado.listarRespostas(pr, p);

  Future<List<Post>> getPostUsuario(String up, int? p) async => servicoApiUsuarioPrivado.listarPostsUsuario(up, p);

  Future<List<Post>> getMeusPosts(int? p) async => servicoApiUsuarioPrivado.listarPostsUsuarioLogado(p);

  Future<void> excluirPost(int id) async => servicoApiUsuarioPrivado.excluirPost(id);

  //Repositórios para Curtidas de Post
  Future<Curtida> curtirPost(int id) async => servicoApiUsuarioPrivado.curtirPost(id);

  Future<List<Curtida>> listarCurtidas(int id) async => servicoApiUsuarioPrivado.listarCurtidas(id);

  Future<void> apagarCurtida(int id) async => servicoApiUsuarioPrivado.excluirCurtida(id);

  //Respositórios para Sessões
  Future<Sessao> iniciarSessao(SessaoAtivado su) async => servicoApiUsuario.novaSessao(su);

  Future<List<Sessao>> getSessoes() async => servicoApiUsuarioPrivado.listarSessoes();

  Future<void> apagarSessao(int c) async => servicoApiUsuarioPrivado.apagarSessao(c);



}