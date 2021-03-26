import 'package:flutter/material.dart';
import 'package:lojinha_alura/widgets/botao_carrinho.dart';

class AppBarCustomizada extends StatelessWidget with PreferredSizeWidget {
  final String titulo;
  final bool ehPaginaCarrinho;

  AppBarCustomizada({this.titulo, this.ehPaginaCarrinho});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme:IconThemeData(
        color: Colors.black,
      ) ,
      title: Text(
        titulo,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      actions: [
        _mudarPaginaCarrinho(ehPaginaCarrinho),
      ],
    );
  }

  _mudarPaginaCarrinho(bool ehPaginaCarrinho){
    if(ehPaginaCarrinho) return Container();
    return BotaoCarrinho();
  }


  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
