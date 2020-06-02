import 'package:flutter/material.dart';
import 'package:mcommerce/models/produto.model.dart';

class Produto extends StatelessWidget {

  final ProdutoModel model;

  Produto(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 10),
      height: 104,
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 25,
            color: Color.fromRGBO(0, 0, 0, 0.08)
          )
        ]
      ),
      child: Row(
        children: [ 
          Image.asset(model.imageUrl),
          SizedBox(width: 11),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.name,
                style: TextStyle(
                  fontFamily: 'Metropolis',
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF222222)
                )
              ),
              SizedBox(height: 4),
              Text(model.brand, 
                style: TextStyle(
                  fontFamily: 'Metropolis',
                  fontSize: 11,
                  color: Color(0xFF9B9B9B),
                  letterSpacing: -0.0015,
                )
              ),
              
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Icon(Icons.star, color: Color(0xFFFFBA49), size: 14),
                    Icon(Icons.star_border, color: Color(0xFF9B9B9B), size: 14),
                    Icon(Icons.star_border, color: Color(0xFF9B9B9B), size: 14),
                    Icon(Icons.star_border, color: Color(0xFF9B9B9B), size: 14),
                    Icon(Icons.star_border, color: Color(0xFF9B9B9B), size: 14),
                    Text("(${model.stars})",
                      style: TextStyle(
                        color: Color(0xFF9B9B9B),
                        fontSize: 10
                      )
                    )
                  ]
                )
              ),

              Text("${model.price}\$", 
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Metropolis',
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF222222),
                )
              ),
            ],
          )
        ]
      )
    );
  }
}