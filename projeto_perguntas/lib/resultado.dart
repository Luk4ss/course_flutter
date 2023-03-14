import 'package:flutter/material.dart';

class Resultado extends StatelessWidget{

  final void Function() quandoReiniciarQuestionario;

  Resultado(this.quandoReiniciarQuestionario);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
                  child: Text('Parabéns!', style: TextStyle(fontSize: 28)),
        ),
        TextButton(
          child: Text('Reiniciar?', style: TextStyle(fontSize: 18)),
          onPressed: quandoReiniciarQuestionario,
        )
      ],
    );
  }


}