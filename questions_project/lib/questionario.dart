// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';

import 'package:questions_project/questao.dart';
import 'package:questions_project/resposta.dart';

class Questionario extends StatelessWidget {

  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoResponder
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {

  List<Map<String, Object>> respostas = temPerguntaSelecionada 
      ? perguntas[perguntaSelecionada]['respostas'] as List<Map<String, Object>>
      : []; 

    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['texto'] as String),
        ...respostas.map((resp) {
          return Resposta(
            resp['texto'].toString(), 
            () => quandoResponder(int.parse(resp['pontuacao'].toString())),
          );
        }).toList()
      ],
    );
  }
}