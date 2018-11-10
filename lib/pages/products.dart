import 'package:flutter/material.dart';

import '../widgets/products/products.dart';

class ProductsPage extends StatelessWidget{

    final List<Map<String, dynamic>> products;

  ProductsPage(this.products);
  
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed:(){
                
              }
            )
          ],
          title: Text("Easy List"), 
        ),
        body: Container(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0
          ),
          child: Products(products),
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                automaticallyImplyLeading: false,
                title: Text("Choose"),
              ),
              ListTile(
                leading: Icon(
                  Icons.settings
                ),
                title: Text("Manage Products"),
                onTap: (){
                  Navigator.pushReplacementNamed(context, '/admin');
                }
              )
            ]
          )
        ),
      );
    }
}