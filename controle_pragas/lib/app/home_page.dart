import 'package:controle_pragas/produto_model.dart';
import 'package:controle_pragas/theme.dart';
import 'package:flutter/material.dart';

import '../api.dart';
import 'detalhe_produto.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  var produtosLista = ApiProduto.fetchProdutos();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: 100,
                  height: 250,
                  decoration: BoxDecoration(
                    color: ThemeApp.theme.colorScheme.secondary,
                  ),
                  child: Align(
                    alignment: const AlignmentDirectional(-1, 0),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'Descubra qual produto usar para combater\na praga na sua planta.',
                        textAlign: TextAlign.end,
                        style: ThemeApp.theme.textTheme.titleLarge?.copyWith(
                            color: ThemeApp.theme.textTheme.titleLarge?.color,),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder<List<ProdutoModel>>(
              future: ApiProduto().getProdutos(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      ProdutoModel produto = snapshot.data![index];
                      return GestureDetector(
                         onTap: () {
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DetalheProdutoPage(produto: produto,)));
                        },
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(12, 12, 20, 12),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Color(0x3416202A),
                                  offset: Offset(
                                    0.0,
                                    2,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12),
                              shape: BoxShape.rectangle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(-1, 0),
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset('assets/ic-prod.png',
                                        fit: BoxFit.none,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 0, 0),
                                          child: Row(
                                            children: [
                                              const Text('Registro: '),
                                              Text(produto.registroProduto.toString(),
                                                  style: ThemeApp
                                                      .theme.textTheme.labelSmall
                                                      ?.copyWith(
                                                    color: ThemeApp
                                                        .theme.colorScheme.secondary,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 0, 0),
                                          child: Row(
                                            children: [
                                              const Text('Nome comercial: '),
                                              Text(produto.marcaComercial[0],
                                                  style: ThemeApp
                                                      .theme.textTheme.labelSmall
                                                      ?.copyWith(
                                                    color: ThemeApp
                                                        .theme.colorScheme.secondary,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 0, 0),
                                          child: Row(
                                            children: [
                                              const Text('Nome Comum: '),
                                              SizedBox(
                                                width: 120,
                                                child: Text(
                                                    produto.pragas
                                                        .map(
                                                            (e) => e.nomeComum).first.join(', '),
                                                    style: ThemeApp
                                                        .theme.textTheme.labelSmall
                                                        ?.copyWith(
                                                      color: ThemeApp
                                                          .theme.colorScheme.secondary,
                                                      fontWeight: FontWeight.bold,
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFF57636C),
                                    size: 18,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Erro ao carregar os produtos'),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
