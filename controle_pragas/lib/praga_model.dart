class PragaModel {
  String cultura;
  String nomeCientifico;
  List<String> nomeComum;

  PragaModel({
    required this.cultura,
    required this.nomeCientifico,
    required this.nomeComum,
  });

  factory PragaModel.fromJson(Map<String, dynamic> json) {
    return PragaModel(
      cultura: json['cultura'],
      nomeCientifico: json['nomeCientifico'],
      nomeComum: List<String>.from(json['nomeComum']),
    );
  }
}
