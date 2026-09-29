import 'package:flutter/material.dart';

import '../model/cep.dart';
import '../services/cep_service.dart';
import '../widgets/input.dart';
import '../widgets/buttons.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _textoBotao = 'Pesquisar CEP';

  Cep? _cep = Cep();

  final CepService _service = CepService();

  TextEditingController _controllerCep = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Consulta CEP'), backgroundColor: Colors.blue),
      body: _body(),
    );
  }

  _body() {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Input(
          'Informe o CEP',
          'Digite somente os números',
          controller: _controllerCep,
        ),
        SizedBox(height: 16),

        Buttons(_textoBotao, onClick: _buscaCep),
        SizedBox(height: 20),

        Text('CEP: ${_cep?.cep ?? ''}'),
        Text('Cidade: ${_cep?.localidade ?? ''}'),
        Text('Estado: ${_cep?.uf ?? ''}'),
        Text('Bairro: ${_cep?.bairro ?? ''}'),
        Text('Logradouro: ${_cep?.logradouro ?? ''}'),
      ],
    );
  }

  Future<void> _buscaCep() async {
    setState(() {
      _textoBotao = 'Buscando cep';
    });

    try {
      final resultado = await _service.buscarCep(_controllerCep.text);

      setState(() {
        _cep = resultado;
      });
    } catch (e) {
      print('Erro: $e');
    } finally {
      setState(() {
        _textoBotao = 'Informe um cep';
      });
    }
  }
}
