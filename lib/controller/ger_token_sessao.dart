import 'package:shared_preferences/shared_preferences.dart';

Future<void> salvarToken(String token) async
{
  final prefsToken = await SharedPreferences.getInstance();
  await prefsToken.setString("token_api", token);
}

Future<String?> getToken() async
{
  final prefsToken = await SharedPreferences.getInstance();
  return prefsToken.getString("token_api");
}

void salvarUsername(String usr) async
{
  final prefsUsr = await SharedPreferences.getInstance();
  prefsUsr.setString("user_name", usr);
}

Future<String?> getUsername() async
{
  final prefsUsr = await SharedPreferences.getInstance();
  return prefsUsr.getString("user_name");
}

