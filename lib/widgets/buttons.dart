import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  String texto;
  final void Function() onClick;

  Buttons(this.texto, {required this.onClick});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onClick, child: Text(texto));
  }
}
