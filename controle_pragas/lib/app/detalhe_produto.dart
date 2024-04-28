import 'package:controle_pragas/theme.dart';
import 'package:flutter/material.dart';
import '../produto_model.dart';

class DetalheProdutoPage extends StatelessWidget {
  final ProdutoModel produto;

  const DetalheProdutoPage({Key? key, required this.produto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Caracteristicas'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/ic-produto.png',
                          fit: BoxFit.none,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              produto.marcaComercial,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                    color:
                                        ThemeApp.theme.textTheme.labelLarge?.color,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              produto.pragas
                                  .map((praga) => praga.nomeCientifico)
                                  .join(', ')
                                  .replaceAll("[", "")
                                  .replaceAll("]", ""),
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                    color:
                                        ThemeApp.theme.textTheme.labelLarge?.color,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, top: 20, bottom: 16),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tipo de praga",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                    color: ThemeApp
                                        .theme.textTheme.labelLarge?.color,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                                produto.pragas
                                  .map((praga) => praga.cultura).toSet().toList() 
                                  .join(', '),
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                    color: ThemeApp
                                        .theme.textTheme.labelLarge?.color,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                "Nomes Comuns",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                      color: ThemeApp
                                          .theme.textTheme.labelLarge?.color,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Text(
                              produto.pragas
                                  .map((praga) => praga.nomeComum)
                                  .join(', ')
                                  .replaceAll("[", "")
                                  .replaceAll("]", ""),
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                    color: ThemeApp
                                        .theme.textTheme.labelLarge?.color,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: Text(
                          "Informações Técnicas",
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                color: ThemeApp.theme.textTheme.labelLarge?.color,
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      DetalheItemWidget(
                          label: "Registro do Produto",
                          description: produto.registroProduto.toString()),
                      DetalheItemWidget(
                          label: "Titular do Registro",
                          description: produto.titularRegistro),
                      DetalheItemWidget(
                          label: "Ingrediente Ativo",
                          description: produto.ingredienteAtivo),
                      DetalheItemWidget(
                          label: "Classes",
                          description: produto.classes.join(', ')),
                      DetalheItemWidget(
                          label: "Aprovado para Agricultura Orgânica",
                          description: produto.aprovadoParaAgriculturaOrganica
                              ? 'Sim'
                              : 'Não'),
                      DetalheItemWidget(
                          label: "Classificação Toxicológica",
                          description: produto.classificacaoToxicologica),
                      DetalheItemWidget(
                          label: "Classificação Ambiental",
                          description: produto.classificacaoAmbiental),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetalheItemWidget extends StatelessWidget {
  final String label;
  final String description;

  const DetalheItemWidget({
    super.key,
    required this.description,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
            height: 2,
            thickness: 1,
            color: Theme.of(context).colorScheme.secondary),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text('$label ',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: ThemeApp.theme.textTheme.labelLarge?.color,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
        ),
        Text(description,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: ThemeApp.theme.textTheme.labelSmall?.color,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                )),
      ],
    );
  }
}
