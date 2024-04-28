import 'dart:convert';
import 'package:http/http.dart' as http;

import 'api_model.dart';
import 'produto_model.dart';

class ApiProduto {


  static Future<List<ProdutoModel>> fetchProdutos() async {
    final response = await http.get(
      Uri.parse(
          'https://api.cnptia.embrapa.br/bioinsumos/v1/produtos-biologicos'),
      headers: {
        'Authorization': 'Bearer 8944b803-e35c-3bb8-93f1-f6c32ad334c9',
        'Content-Type': 'application/json',
        'cache-control': 'max-age=10',
      },
    );

    //fazer refreseh token

    if (response.statusCode == 200) {
      final json = utf8.decode(response.bodyBytes);
          return ApiModel.fromJson(jsonDecode(json)).data;
    } else {
      throw Exception('Failed to fetch produtos');
    }
  }

  Future<List<ProdutoModel>> getProdutos() async {
    List<ProdutoModel> produtos = [];
    List<ProdutoModel> fetchedProdutos = await fetchProdutos();
    for (var produto in fetchedProdutos) {
      produtos.add(produto);
    }
    return produtos;
  }
}
