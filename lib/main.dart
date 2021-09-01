import 'package:flutter/material.dart';
import 'package:projeto_final/cadastro.dart';
import 'package:projeto_final/login_page.dart';
import 'package:projeto_final/preferencia_usuario.dart';
import 'package:projeto_final/rotas.dart';
import 'package:projeto_final/tela_usuarios.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenciaDoUsuario.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projeto Final - App Dev',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        AppRoutes.HOME: (_) => LoginPage(),
        AppRoutes.CADASTRO: (_) => Cadastro(),
        AppRoutes.TELAUSUARIOS: (_) => TelaUsuarios(),
      },
    );
  }
}
