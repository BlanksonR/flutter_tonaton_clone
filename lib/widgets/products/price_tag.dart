import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget{
  final String price;

  PriceTag(this.price);
  
  @override
  Widget build(BuildContext context){
    return Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 4.0,
                    horizontal: 8.0
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(5.0)
                  ),
                  child: Text(
                  '\$$price',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0
                  ),
                  )
                );
  }
}