import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lojinha_alura/main.dart';
import 'package:lojinha_alura/modelo/item_carrinho.dart';
import 'package:lojinha_alura/modelo/movel.dart';
import 'package:lojinha_alura/widgets/texto_detalhes.dart';

class CardDetalhes extends StatelessWidget {
  final formatacaoReais = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  final Movel movel;

  CardDetalhes({this.movel});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextoDetalhes(
            texto: movel.titulo,
            estilo: Theme.of(context).textTheme.headline1,
          ),
          TextoDetalhes(texto: movel.descricao),
          Container(
            margin: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  formatacaoReais.format(movel.preco),
                  style: Theme.of(context).textTheme.headline1,
                ),
                FlatButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    _adicionarItemCarrinho(ItemCarrinho(
                      movel: movel,
                      quantidade: 1,
                    ));
                  },
                  child: Text(
                    'Comprar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _adicionarItemCarrinho(ItemCarrinho item) {
    Inicio.itensCarrinho.add(item);
  }
}
