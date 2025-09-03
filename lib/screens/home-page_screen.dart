import 'package:flutter/material.dart';

import '../component/menu_component.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("App Base")),
      drawer: const MenuComponent(), // Menu lateral
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/Images/Logo.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),
            const Text("Página inicial"),
          ],
        ),
      ),
    );
  }
}