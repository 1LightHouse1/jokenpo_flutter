import 'dart:html';
import 'dart:math';
import 'package:flutter/material.dart';

class JokempoHome extends StatefulWidget {
  const JokempoHome({super.key});

  @override
  State<JokempoHome> createState() => _JokempoHomeState();
}

class _JokempoHomeState extends State<JokempoHome> {
  final _imgPadrao = Image(image: AssetImage('assets/images/padrao.png'));

  var _imgApp = Image(image: AssetImage('assets/images/padrao.png'));
  var _imgAppMaquina = Image(image: AssetImage('assets/images/padrao.pg'));
  String _mensagem = 'Resultado';
  int numVitorias = 0;
  int numDerrotas = 0;
  int numEmpates = 0;

  void _joga(String opcaoJogador) {
    final lista_opcoes = ['pedra', 'papel', 'tesoura'];
    final opcaoApp = lista_opcoes[Random().nextInt(3)];

    setState(() {
      _imgApp = Image.asset('assets/images/$opcaoJogador.png');
      _imgAppMaquina = Image(image: AssetImage('assets/images/$opcaoApp.png'));
      _message = _resultado(opcaoJogador, opcaoJogador);
    });
  }

  String _resultado(String opcaoJogador, String opcaoApp) {
    if ((opcaoJogador == 'pedra' && opcaoApp == 'tesoura') ||
        (opcaoJogador == 'tesoura' && opcaoApp == 'papel') ||
        (opcaoJogador == 'papel' && opcaoApp == 'pedra'){
      numVitorias++;
      return 'Jogador ganhou';    
    } else if(opcaoApp == opcaoJogador){
      numEmpates++;
      return 'Empate!!!';
      } else{
        numDerrotas++;
        return 'O computador venceu!';
      }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Jokenpo TADS 22'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: textHome(_mesagem),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(children: [
                Sizebox(
                  width: 120,
                  child: Align(
                    alignment: Alignment.center,
                    child: textHome("Sua Escolha"),
                  ),
                ),
                Align(alignment: Alignment.center, child: _imgApp),
              ]),
              Column(
                children:[
                  Text(
                    "X",
                    textScaler: TextScaler.linear(3),
                  )
                ],
              ),
              Column(
                children: [
                  textHome("Escolha do Computador"),
                  Align(alignment: Alignment.centerRight, child: _imgAppMaquina) 
                ],
              ),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children:[
            choisePlayerDetector('pedra',
                      image: Image.asset(
                        'assets/images/pedra.png',
                        width: 80,
                      )),
                    choisePlayerDetector('papel',
                      image: Image.asset(
                        'assets/images/papel.png',
                        width: 80,
                      )),
                    choisePlayerDetector('tesoura',
                      image: Image.asset(
                        'assets/images/tesoura.png',
                        width: 80,
                      )),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              counterWrapCircle('Vitórias', numVitorias.toString()),
              counterWrapCircle('Empate', numEmpates.toString()),
              counterWrapCircle('Derrotas', numDerrotas.toString()),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState((){
            numEmpates = 0;
            numDerrotas = 0;
            numVitorias = 0;
            _imgApp = _imgPadrao;
            _imgAppMaquina = _imgPadrao;
          });
        },
        child: const Icon(Icons.settings_backup_restore_sharp),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  Text  textHome(String text){
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
  }

  GestureDetector choisePlayerDetector(String PlayerOpp, {Image? image}){
    return GestureDetector(
      onTap () => _joga(PlayerOpp),
      child: image,
    );
  }

  Sizebox counterWrapCircle(String textTop, String textBottom){
    return Sizebox(
      height:90,
      width: 90,
      child: ClipOval(
        child: Material(
          color: Theme.of(context).colorScheme.primary,
          child:
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  textop,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Sizebox(
                  height: 5,
                ),
                Text(
                  textBottom,
                )
              ]),
        ),
      ));
  }
}
