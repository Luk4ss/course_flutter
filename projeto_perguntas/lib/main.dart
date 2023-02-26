import 'package:flutter/material.dart';

void main() => runApp(PerguntaApp());
  
class _PerguntaAppState extends State<PerguntaApp>{

  int _perguntaSelecionada = 0;

  void _responder(){
    setState(() {
      _perguntaSelecionada++;
    });
     print('Pergunta respondida!');
  }

  @override
  Widget build(BuildContext context) {

    final perguntas = [
    'Qual é a sua cor favorita?',
    'Qual é o seu animal favorito?',
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: Column(
          children: [
             Text(perguntas[_perguntaSelecionada]),
             ElevatedButton(
              child: Text('Resposta 1'),
              onPressed: _responder,
             ),
             ElevatedButton(
              child: Text('Resposta 2'),
              onPressed: _responder,
             ),
             ElevatedButton(
              child: Text('Resposta 3'),
              onPressed: _responder,
             )
          ],
        )
      ),
    );
  }

}

class PerguntaApp extends StatefulWidget{

  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
  
}