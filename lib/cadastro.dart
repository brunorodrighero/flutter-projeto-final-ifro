import 'package:flutter/material.dart';
import 'package:projeto_final/preferencia_usuario.dart';
import 'package:projeto_final/rotas.dart';

String? _senha;
String? _usuario;
String? _email;

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tela de Cadastro")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Ex: João da Silva',
                    labelText: 'Nome *',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Digite o nome";
                    }
                    _usuario = value;
                    return null;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'email@email.com.br',
                    labelText: 'E-mail *',
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.contains('@')) {
                      return "E-mail inválido.";
                    }
                    _email = value;
                    return null;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Digite a senha desejada',
                    labelText: 'Senha *',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Senha inválida.";
                    }
                    _senha = value;
                    return null;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Digite novamente a senha',
                    labelText: 'Confirmar Senha *',
                  ),
                  validator: (value) {
                    if (value == null || value != _senha) {
                      _senha = null;
                      return "A senha não confere ou está vazia";
                    }
                    _senha = value;
                    return null;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processando os dados!')),
                      );
                      await PreferenciaDoUsuario.setUsuario(
                          _usuario.toString());
                      await PreferenciaDoUsuario.setEmail(_email.toString());
                      await PreferenciaDoUsuario.setSenha(_senha.toString());
                      Navigator.of(context).pushNamed(AppRoutes.HOME);
                    }
                  },
                  child: Text('Salvar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
