import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  String hint; //aparece dentro do input
  String label; // texto que aparece do lado esquerdo do input
  TextEditingController controller; //para pegar o texto digitado
  Input(this.label, this.hint, {required this.controller});
  //construtor
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(hintText: hint, labelText: label),
    );
  }
}
