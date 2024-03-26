import 'dart:html';
import 'dart:math';
import 'package:flutter/material.dart';

class JokempoHome extends StatefulWidget {
  const JokempoHome({super.key});

  @override
  State<JokempoHome> createState() => _JokempoHomeState();
}

class _JokempoHomeState extends State<JokempoHome> {
  void _joga(String opcaoJogador) {
    final lista_opcoes = ['pedra', 'papel', 'tesoura'];
    final opcaoApp = lista_opcoes[Random().nextInt(3)];

    setState(() {
      _imgApp = Image.asset('assets/images/$opcaoApp.png');
      _message = _resultado(opcaoJogador, opcaoJogador);
    });
  }

  String _resultado(String opcaoJogador, String opcaoApp) {
    if (opcaoJogador == 'pedra' && opcaoApp == 'tesoura' ||
        opcaoJogador == 'tesoura' && opcaoApp == 'papel' ||
        opcaoJogador == 'papel' && opcaoApp == 'pedra'){
          
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jokenpo TADS 22'),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
