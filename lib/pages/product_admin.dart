import 'package:flutter/material.dart';

import './product_list.dart';
import './product_create.dart';


class ProductAdmin extends StatelessWidget{

  final Function addProduct;
  final Function deleteProduct;

  ProductAdmin(this.addProduct, this.deleteProduct);
  @override
  Widget build(BuildContext context){
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
      appBar: AppBar(
        title: Text("Manage Products"),
        bottom: TabBar(
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.create),
              text: "Create Product"
            ),
            Tab(
              icon: Icon(Icons.list),
              text: "My Products"
            )
          ],
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          ProductCreatePage(addProduct),
          ProductListPage()
        ]
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text("Choose")
            ),
            ListTile(
              leading: Icon(
                Icons.shop
              ),
              title: Text("All Products"),
              onTap: (){
                Navigator.pushReplacementNamed(context, '/main');
              }
            )
          ],
        )
      ),
    ),);
  }
}