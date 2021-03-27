import 'package:flutter/material.dart';
import 'package:lojinha_alura/modelo/movel.dart';
import 'package:lojinha_alura/paginas/detalhes.dart';
import 'package:lojinha_alura/widgets/degrade_elemento_grid_produtos.dart';
import 'package:lojinha_alura/widgets/imagem_elemento_grid_produtos.dart';
import 'package:lojinha_alura/widgets/titulo_elemento_grid_produtos.dart';

class ElementoGridProdutos extends StatelessWidget {
  final Movel movel;

  ElementoGridProdutos({this.movel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detalhes(movel: movel),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 8,
            color: Colors.black12,
          )
        ]),
        margin: EdgeInsets.all(10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            alignment: Alignment.center,
            children: [
              ImagemElementoGridProdutos(
                imagem: movel.foto,
              ),
              DegradeElementoGridProdutos(),
              TituloElementoGridProdutos(
                titulo: movel.titulo,
              )
            ],
          ),
        ),
      ),
    );
  }
}
