import 'package:flutter/material.dart';
import 'package:mcommerce/widgets/itemCategoria.dart';
import 'package:mcommerce/widgets/produto.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class CatalogoPage extends StatelessWidget
{
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
                      blurRadius: 12
                    )
                  ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(8, 8, 0, 30),
                      child: Icon(Icons.arrow_back_ios)
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(14, 0, 0, 35),
                      child: Text("Women's tops", 
                        style: TextStyle(
                          fontSize:34, 
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF222222)
                        )
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
                        ]
                      )
                    )
                  ]
                )
              ),
              Container(
                child: StreamBuilder(
                  stream: Firestore.instance.collection('products').orderBy('name').snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if(snapshot.connectionState == ConnectionState.waiting)
                      return Center(child: CircularProgressIndicator());

                    return Flexible(
                      child: ListView.builder(
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (_, indice) {
                          String name = snapshot.data.documents[indice]['name'];
                          String brand = snapshot.data.documents[indice]['brand'];
                          int stars = snapshot.data.documents[indice]['stars'];
                          double price = snapshot.data.documents[indice]['price'];
                          String imageUrl = snapshot.data.documents[indice]['image_url'];
                          return Produto(name, brand, stars, price, imageUrl); 
                        },
                      ),
                    );
                  }
                ),
                // child: Flexible(
                //   child: ListView(
                //     children: <Widget>[
                //       Produto("Pullover", "Mango", 3, 51, "assets/images/modelo1.png"),
                //       Produto("Blouse", "Dorothy Perkins", 0, 34, "assets/images/modelo2.png"),
                //       Produto("T-shirt", "LOST Ink", 10, 12, "assets/images/modelo3.png"),
                //     ],
                //   ),
                // )
              )
            ]
          ),
        ),
      );
  }
  
}