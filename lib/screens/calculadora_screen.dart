import 'package:flutter/material.dart';
import '../component/menu_component.dart';

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  String _display = '0';
  double? _primeiroNumero;
  String? _operador;
  bool _deveLimpar = false;

  void _botaoPressionado(String valor) {
    setState(() {
      if (valor == 'AC') {
        _display = '0';
        _primeiroNumero = null;
        _operador = null;
        _deveLimpar = false;
      } else if (valor == '.') {
        if (!_display.contains('.')) {
          _display += '.';
        }
      } else if (valor == '+' || valor == '-' || valor == 'x' || valor == '÷') {
        _primeiroNumero = double.tryParse(_display);
        _operador = valor;
        _deveLimpar = true;
      } else if (valor == '=') {
        if (_primeiroNumero != null && _operador != null) {
          double segundoNumero = double.tryParse(_display) ?? 0;
          double resultado = 0;

          switch (_operador) {
            case '+':
              resultado = _primeiroNumero! + segundoNumero;
              break;
            case '-':
              resultado = _primeiroNumero! - segundoNumero;
              break;
            case 'x':
              resultado = _primeiroNumero! * segundoNumero;
              break;
            case '÷':
              if (segundoNumero != 0) {
                resultado = _primeiroNumero! / segundoNumero;
              } else {
                _display = 'Erro';
                return;
              }
              break;
          }

          _display = resultado.toStringAsFixed(
            resultado.truncateToDouble() == resultado ? 0 : 2,
          );
          _primeiroNumero = null;
          _operador = null;
          _deveLimpar = true;
        }
      } else {
        if (_display == '0' || _deveLimpar) {
          _display = valor;
          _deveLimpar = false;
        } else {
          _display += valor;
        }
      }
    });
  }

  Widget _botao(String texto, {Color? cor, Color? corTexto}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ElevatedButton(
          onPressed: () => _botaoPressionado(texto),
          style: ElevatedButton.styleFrom(
            backgroundColor: cor ?? Colors.grey[300],
            foregroundColor: corTexto ?? Colors.black87,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 20),
          ),
          child: Text(
            texto,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final corOperador = Colors.lightBlueAccent;
    final corTextoOperador = Colors.white;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora"),
      ),
      drawer: const MenuComponent(),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.centerRight,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
                child: Text(
                  _display,
                  style: const TextStyle(
                      fontSize: 36, fontWeight: FontWeight.w500),
                ),
              ),
              Row(children: [
                _botao("AC", cor: Colors.grey, corTexto: Colors.white),
                _botao("÷", cor: corOperador, corTexto: corTextoOperador),
              ]),
              Row(children: [
                _botao("7"),
                _botao("8"),
                _botao("9"),
                _botao("x", cor: corOperador, corTexto: corTextoOperador),
              ]),
              Row(children: [
                _botao("4"),
                _botao("5"),
                _botao("6"),
                _botao("-", cor: corOperador, corTexto: corTextoOperador),
              ]),
              Row(children: [
                _botao("1"),
                _botao("2"),
                _botao("3"),
                _botao("+", cor: corOperador, corTexto: corTextoOperador),
              ]),
              Row(children: [
                _botao("0"),
                _botao("."),
                _botao("=", cor: corOperador, corTexto: corTextoOperador),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
