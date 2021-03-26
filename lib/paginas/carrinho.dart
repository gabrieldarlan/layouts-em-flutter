import 'package:flutter/material.dart';
import 'package:lojinha_alura/widgets/appbar_customizada.dart';

class Carrinho extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBarCustomizada(titulo: 'Carrinho',ehPaginaCarrinho: true,),
      body: Text('Estamos no carrinho, hummm que gostoso'),
    );
  }
}
