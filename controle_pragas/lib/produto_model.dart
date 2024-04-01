import 'praga_model.dart';

class ProdutoModel {
  final int registroProduto;
  final String marcaComercial;
  final String titularRegistro;
  final String ingredienteAtivo;
  final List<String> classes;
  final List<PragaModel> pragas;
  final bool aprovadoParaAgriculturaOrganica;
  final String classificacaoToxicologica;
  final String classificacaoAmbiental;
  final String url;

  ProdutoModel({
    required this.registroProduto,
    required this.marcaComercial,
    required this.titularRegistro,
    required this.ingredienteAtivo,
    required this.classes,
    required this.pragas,
    required this.aprovadoParaAgriculturaOrganica,
    required this.classificacaoToxicologica,
    required this.classificacaoAmbiental,
    required this.url,
  });

  factory ProdutoModel.fromJson(Map<String, dynamic> json) {
    return ProdutoModel(
      registroProduto: json['registroProduto'],
      marcaComercial: json['marcaComercial'],
      titularRegistro: json['titularRegistro'],
      ingredienteAtivo: json['ingredienteAtivo'],
      classes: List<String>.from(json['classes']),
      pragas: List<PragaModel>.from(
          json['pragas'].map((praga) => PragaModel.fromJson(praga))),
      aprovadoParaAgriculturaOrganica: json['aprovadoParaAgriculturaOrganica'],
      classificacaoToxicologica: json['classificacaoToxicologica'],
      classificacaoAmbiental: json['classificacaoAmbiental'],
      url: json['url'],
    );
  }

  
}
