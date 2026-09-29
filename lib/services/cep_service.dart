import 'package:dio/dio.dart';

import '../model/cep.dart';

class CepService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://viacep.com.br/ws/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<Cep> buscarCep(String cep) async {
    try {
      final response = await _dio.get('$cep/json/');

      if (response.statusCode == 200) {
        if (response.data['erro'] == true) {
          throw Exception('CEP não encontrado');
        }

        return Cep.fromJson(response.data);
      } else {
        throw Exception('Erro na requisição');
      }
    } on DioException catch (e) {
      throw Exception('Erro de conexão: ${e.message}');
    }
  }
}
