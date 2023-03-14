import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';


void main() => runApp(PerguntaApp());
  
class _PerguntaAppState extends State<PerguntaApp>{

  int _perguntaSelecionada = 0;
  final List<Map<String, Object>> _perguntas =  const[
      {
        'texto' : 'Qual é a sua cor favorita?',
        'respostas': ['Preto','vermelho','Verde', 'Branco']
      },
      {
        'texto' : 'Qual é o seu animal favorito?',
        'respostas': ['Coelho','Cobra','Elefante', 'Leão']
      },
      {
        'texto' : 'Qual é o seu instrutor favorito?',
        'respostas': ['Maria','João','Leo', 'Pedro']
      }
    ];

  void _responder(){
    if(temPerguntaSelecionada){
      setState(() {
          _perguntaSelecionada++;
      });
    }   
  }

  void _reiniciarQuestionario(){
    setState(() {
      _perguntaSelecionada = 0;
    });
  }

 bool get temPerguntaSelecionada{
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada ? 
          Questionario(
            perguntas: _perguntas, 
            perguntaSelecionada: _perguntaSelecionada,
             responder: _responder
          ) 
          : Resultado(_reiniciarQuestionario)
      ),
    );
  }

}

class PerguntaApp extends StatefulWidget{

  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
  
}