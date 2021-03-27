import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lojinha_alura/main.dart';
import 'package:lojinha_alura/modelo/item_carrinho.dart';
import 'package:lojinha_alura/modelo/movel.dart';

class ListaCarrinho extends StatefulWidget {
  final Function atualiza;

  ListaCarrinho({this.atualiza});

  @override
  _ListaCarrinhoState createState() => _ListaCarrinhoState();
}

class _ListaCarrinhoState extends State<ListaCarrinho> {
  final formatacaoReais=NumberFormat.currency(locale: 'pt_BR',symbol: 'R\$');
  final List<ItemCarrinho> carrinho = Inicio.itensCarrinho;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: carrinho.length,
      itemBuilder: (BuildContext context, indice) {
        ItemCarrinho item = carrinho[indice];
        Movel movel = item.movel;
        return Container(
          margin: EdgeInsets.all(16),
          child: Card(
            clipBehavior: Clip.hardEdge,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Image(
                    fit: BoxFit.cover,
                    image:
                        AssetImage('utilidades/assets/imagens/${movel.foto}'),
                    height: 92,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 92,
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          movel.titulo,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(formatacaoReais.format(movel.preco)),
                            Row(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () => _aumentarQuantidade(item),
                                  child: Container(
                                    child: Icon(
                                      Icons.add,
                                      size: 16,
                                    ),
                                    margin: EdgeInsets.all(8),
                                  ),
                                ),
                                Text('${item.quantidade}'),
                                GestureDetector(
                                  onTap: () => _diminuirQuantidade(item),
                                  child: Container(
                                    child: Icon(
                                      Icons.remove,
                                      size: 16,
                                    ),
                                    margin: EdgeInsets.all(8),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _aumentarQuantidade(ItemCarrinho item) {
    setState(() {
      item.quantidade++;
      widget.atualiza();
    });
  }

  _diminuirQuantidade(ItemCarrinho item) {
    if (item.quantidade > 1) {
      setState(() {
        item.quantidade--;
        widget.atualiza();
      });
    } else {
      _removerMovel(item);
    }
  }

  _removerMovel(ItemCarrinho item) {
    setState(() {
      Inicio.itensCarrinho.remove(item);
      widget.atualiza();
    });
  }
}
