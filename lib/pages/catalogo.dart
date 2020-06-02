import 'package:flutter/material.dart';
import 'package:mcommerce/models/produto.model.dart';
import 'package:mcommerce/widgets/itemCategoria.dart';
import 'package:mcommerce/widgets/produto.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class CatalogoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 190,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.12),
                    offset: Offset(0, 4),
                    blurRadius: 12,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(8, 8, 0, 30),
                    child: Icon(Icons.arrow_back_ios),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(14, 0, 0, 35),
                    child: Text(
                      "Women's tops",
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF222222),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                    height: 32,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ItemCategoria("T-shirts"),
                        ItemCategoria("Crops tops"),
                        ItemCategoria("Sleeveless"),
                        ItemCategoria("Shirts")
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: StreamBuilder(
                stream: Firestore.instance
                    .collection('products')
                    .orderBy('name')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return Center(child: CircularProgressIndicator());

                  return Flexible(
                    child: ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (_, indice) {
                        var model = ProdutoModel.fromJson(snapshot.data.documents[indice].data);
                        return Produto(model);
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
