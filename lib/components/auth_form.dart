import 'package:flutter/material.dart';
import 'package:mini_market_v1/pages/home_page.dart';

enum AuthMode { signup, login }

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final bool _isLoading = false;
  AuthMode _authMode = AuthMode.login;

  final Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  bool _isLogin() => _authMode == AuthMode.login;
  bool _isSignup() => _authMode == AuthMode.signup;

  void _switchAuthMode() {
    setState(() {
      if (_isLogin()) {
        _authMode = AuthMode.signup;
      } else {
        _authMode = AuthMode.login;
      }
    });
  }

  void _submit() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));
//     final isValid = _formKey.currentState?.validate() ?? false;
//
//     if (!isValid) {
//       return;
//     }
//
//     setState(() => _isLoading = true);
//
//     _formKey.currentState?.save();
//
//     if (_isLogin()) {
//       Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));
//     } else {
//       // Registrar
//     }
//
//     setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        height: _isLogin() ? 310 : 400,
        width: deviceSize.width * 0.75,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'E-mail'),
                keyboardType: TextInputType.emailAddress,
                onSaved: (email) => _authData['email'] = email ?? '',
                validator: (email) {
                  //final email = email ?? '';
                  if (email != null) {
                    if (email.trim().isEmpty || !email.contains('@')) {
                      return 'Informe um e-mail válido.';
                    }
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Senha'),
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                controller: _passwordController,
                onSaved: (password) => _authData['password'] = password ?? '',
                // ignore: no_leading_underscores_for_local_identifiers
                validator: (_password) {
                  final password = _password ?? '';
                  if (password.isEmpty || password.length < 5) {
                    return 'Informe uma senha válida';
                  }
                  return null;
                },
              ),
              if (_isSignup())
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Confirmar Senha'),
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  validator: _isLogin()
                      ? null
                      // ignore: no_leading_underscores_for_local_identifiers
                      : (_password) {
                          final password = _password ?? '';
                          if (password != _passwordController.text) {
                            return 'Senhas informadas não conferem.';
                          }
                          return null;
                        },
                ),
              const SizedBox(height: 20),
              if (_isLoading)
                const CircularProgressIndicator()
              else
                ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 8,
                      ),
                      backgroundColor: const Color.fromRGBO(1, 149, 146, 1),
                      foregroundColor: Colors.white),
                  child: Text(
                    _authMode == AuthMode.login ? 'ENTRAR' : 'REGISTRAR',
                  ),
                ),
              const Spacer(),
              TextButton(
                onPressed: _switchAuthMode,
                child: Text(_isLogin() ? 'CADASTRAR-SE' : 'VOLTAR',
                    style: const TextStyle(
                      color: Color.fromRGBO(1, 149, 146, 1),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
