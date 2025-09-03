import 'package:flutter/material.dart';
import 'package:trabalhoflutter/screens/calculadora_screen.dart';
import 'package:trabalhoflutter/screens/login_screen.dart';
import 'package:trabalhoflutter/screens/sobre_screen.dart';
import '../screens/home-page_screen.dart';

class MenuComponent extends StatelessWidget {
  const MenuComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text("Menu", style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            title: const Text("Home"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) => const HomePage()));
            },
          ),
          ListTile(
            title: const Text("Calculadora"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,MaterialPageRoute(builder: (_) => const CalculadoraPage()));
            },
          ),
          ListTile(
            title: const Text("Sobre"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,MaterialPageRoute(builder: (_) => const SobrePage()));
            },
          ),
          ListTile(
            title: const Text("Sair"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,MaterialPageRoute(builder: (_) => const LoginPage()));
            },
          ),
        ],
      ),
    );
  }
}