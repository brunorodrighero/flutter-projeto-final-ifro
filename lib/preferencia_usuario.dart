import 'package:shared_preferences/shared_preferences.dart';

class PreferenciaDoUsuario {
  static SharedPreferences? _preferences;
  static const _keyUsuario = 'usuario';
  static const _keyEmail = 'email@email.com';
  static const _keySenha = '123';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUsuario(String usuario) async =>
      await _preferences!.setString(_keyUsuario, usuario);
  static Future setEmail(String email) async =>
      await _preferences!.setString(_keyEmail, email);
  static Future setSenha(String senha) async =>
      await _preferences!.setString(_keySenha, senha);

  static String getUsuario() =>
      _preferences!.getString(_keyUsuario).toString();
  static String getEmail() => _preferences!.getString(_keyEmail).toString();
  static String getSenha() => _preferences!.getString(_keySenha).toString();
}
