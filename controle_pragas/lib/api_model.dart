import 'package:controle_pragas/produto_model.dart';

class ApiModel{
   final Map<String, dynamic> meta;
  final List<ProdutoModel> data;

  ApiModel({required this.meta, required this.data}); 

  factory ApiModel.fromJson(Map<String, dynamic> json){
    return ApiModel(
      meta: json['meta'],
      data: List<ProdutoModel>.from(json['data'].map((produto) => ProdutoModel.fromJson(produto))),
    );
  }




}




