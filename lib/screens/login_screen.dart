import 'package:flutter/material.dart';

import 'home-page_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  void _login() {
    if (_userCtrl.text == 'admin' && _passCtrl.text == '123') {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomePage()),);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Usuário ou senha inválidos')),);
    }
  }

  @override
  void dispose() {
    _userCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: _userCtrl, decoration: const InputDecoration(hintText: 'Usuário')),
            const SizedBox(height: 12),
            TextField(controller: _passCtrl, obscureText: true, decoration: const InputDecoration(hintText: 'Senha')),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _login, child: const Text('Entrar')),
          ],
        ),
      ),
    );
  }
}
