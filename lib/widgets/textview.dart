import 'package:flutter/material.dart';

class Textview extends StatelessWidget {
  String texto;
  Color cor;
  //atributos da classe
  Textview(this.texto, this.cor);
  //construtor da classe
  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: TextStyle(
        backgroundColor: cor,
        fontSize: 89,
        color: Colors.lightGreenAccent,
      ),
    );
  }
}
