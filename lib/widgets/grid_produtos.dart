import 'package:flutter/material.dart';
import 'package:lojinha_alura/modelo/movel.dart';
import 'package:lojinha_alura/widgets/elemento_grid_produtos.dart';

class GridProdutos extends StatelessWidget {
  final moveis;

  GridProdutos({this.moveis});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 02,
      ),
      itemCount: moveis.length,
      itemBuilder: (BuildContext context, indice) {
        final movel = Movel.fromJson(moveis[indice]);
        return ElementoGridProdutos(
          movel: movel,
        );
      },
    );
  }
}
