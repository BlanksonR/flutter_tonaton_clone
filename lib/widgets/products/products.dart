import 'package:flutter/material.dart';
import './product_card.dart';

class Products extends StatelessWidget{

  final List<Map<String, dynamic>> products;

  Products(this.products);

  Widget _buildProductItem(BuildContext context, int index){
    return Container(
      margin: EdgeInsets.only(
        bottom: 10.0
      ),
      child: ProductCard(products[index], index)
    );
  }

  @override
  Widget build(BuildContext context) {
      // TODO: implement build
      return products.length > 0 ? ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      ) : Center(
        child: Text(
          "No products found, please add new products.",
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.center,
        ),
      );
    }
}