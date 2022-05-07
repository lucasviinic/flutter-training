import 'package:flutter/material.dart';

import 'package:questions_project/questionario.dart';
import 'package:questions_project/resultado.dart';


main () => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = const [
      {
        'texto': 'Qual é a sua cor favorita?',
        'respostas': [
          {'texto': 'Preto', 'pontuacao': 10},
          {'texto': 'Vermelho', 'pontuacao': 5}, 
          {'texto': 'Verde', 'pontuacao': 3},
          {'texto': 'Branco', 'pontuacao': 1}
        ]
      },
      {
        'texto': 'Qual o seu animal favorito?',
        'respostas': [
          {'texto': 'Coelho', 'pontuacao': 10},
          {'texto': 'Cobra', 'pontuacao': 5},
          {'texto': 'Elefante', 'pontuacao': 3},
          {'texto': 'Leão', 'pontuacao': 1}
        ]
      },
      {
        'texto': 'Qual a sua série favorita?',
        'respostas': [
          {'texto': 'Sherlock', 'pontuacao': 10},
          {'texto': 'Vikings', 'pontuacao': 5},
          {'texto': 'Dark', 'pontuacao': 3},
          {'texto': 'The Last Kingdom', 'pontuacao': 1}
        ]
      }
    ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
    print('Pontuação Total: $_pontuacaoTotal');
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
 
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perguntas"),
        ),
        body: temPerguntaSelecionada 
          ? Questionario(
              perguntas: _perguntas, 
              perguntaSelecionada: _perguntaSelecionada, 
              quandoResponder: _responder
            ) 
          : Resultado(_pontuacaoTotal),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}