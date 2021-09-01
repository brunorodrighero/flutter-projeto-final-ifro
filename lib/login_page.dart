import 'package:projeto_final/preferencia_usuario.dart';
import 'package:flutter/material.dart';
import 'package:projeto_final/rotas.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? _email;
  String? _senha;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página de Login'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      'http://103.225.168.73/loginnew/IMAGE/avatar.png',
                      width: 200,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'E-mail',
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !value.contains('@')) {
                            return "E-mail inválido.";
                          }
                          this._email = value;
                          return null;
                        }),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Senha',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Senha inválida.";
                          }
                          this._senha = value;
                          return null;
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate() &&
                              await PreferenciaDoUsuario.getEmail() == _email &&
                              await PreferenciaDoUsuario.getSenha() == _senha) {
                            Navigator.of(context)
                                .pushNamed(AppRoutes.TELAUSUARIOS);
                          } else {
                            AlertDialog(
                              title: Text("Erro"),
                              content: Text(PreferenciaDoUsuario.getEmail()),
                            );
                          }
                        },
                        child: Text('Entrar'),
                        style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(10)),
                          textStyle: MaterialStateProperty.all(
                              TextStyle(fontSize: 25)),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      child: Text('Clique aqui para criar um usuário e senha.',
                          style: TextStyle(color: Colors.blue, fontSize: 15)),
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRoutes.CADASTRO);
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
