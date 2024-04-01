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
        title: Text(produto.marcaComercial),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
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
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 700,
                        decoration: BoxDecoration(
                          color: ThemeApp.theme.colorScheme.secondary,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(12),
                              child: Text('Pragas Combatidas',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                        color: ThemeApp
                                            .theme.textTheme.titleLarge?.color,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Cultura",
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                produto.pragas
                                    .map((praga) => praga.cultura)
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
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Nome Científico",
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                produto.pragas
                                    .map((praga) => praga.nomeCientifico)
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
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Nome Comum",
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                produto.pragas
                                    .map((praga) => praga.nomeComum)
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
                            )
                          ],
                        ),
                      ),
                      DetalheItemWidget(
                          label: "Registro do Produto",
                          description: produto.registroProduto.toString()),
                      DetalheItemWidget(
                          label: "Nome Comercial",
                          description: produto.marcaComercial),
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
              height: 4,
              thickness: 2,
              color: Theme.of(context).colorScheme.secondary),
          Text('$label: ',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: ThemeApp.theme.textTheme.labelLarge?.color,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
          Text(description,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: ThemeApp.theme.textTheme.labelSmall?.color,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  )),
        ],
      ),
    );
  }
}
