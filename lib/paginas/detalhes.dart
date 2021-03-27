import 'package:flutter/material.dart';
import 'package:lojinha_alura/modelo/movel.dart';
import 'package:lojinha_alura/widgets/appbar_customizada.dart';

class Detalhes extends StatelessWidget {
  final Movel movel;

  const Detalhes({Key key, this.movel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('utilidades/assets/imagens/${movel.foto}'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBarCustomizada(
          titulo: '',
          ehPaginaCarrinho: false,
        ),
        body: FlatButton(
          onPressed: () {
            Navigator.pushNamed(context, '/carrinho');
          },
          child: Text('Agora para a pagina carrinho'),
        ),
      ),
    );
  }
}
