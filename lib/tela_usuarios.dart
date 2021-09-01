import 'package:flutter/material.dart';
import 'package:projeto_final/preferencia_usuario.dart';

class TelaUsuarios extends StatefulWidget {
  const TelaUsuarios({Key? key}) : super(key: key);
  @override
  _TelaUsuariosState createState() => _TelaUsuariosState();
}

class _TelaUsuariosState extends State<TelaUsuarios> {
  String nome = PreferenciaDoUsuario.getUsuario();
  String email = PreferenciaDoUsuario.getEmail();
  String senha = PreferenciaDoUsuario.getSenha();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Usuários Cadastrados"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                Text("Nome: $nome",),
                Text("E-mail: $email"),
                Text("Senha: $senha")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
