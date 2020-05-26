import 'package:flutter/material.dart';

class ItemCategoria extends StatelessWidget {

  String nome;

  ItemCategoria(this.nome);

  void alteraNome(String n) {
    this.nome = n;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 7),
        width: 100,
        height: 30,
        decoration: BoxDecoration(
            color: Color(0xFF222222),
            borderRadius: BorderRadius.all(Radius.circular(29))),
        child: Center(
          child: Text(nome,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  height: 1)),
        ));
  }
}
