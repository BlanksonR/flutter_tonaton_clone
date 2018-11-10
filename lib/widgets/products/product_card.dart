import 'package:flutter/material.dart';
import './price_tag.dart';

class ProductCard extends StatelessWidget{

  final Map<String, dynamic> product;
  final int productIndex;

  ProductCard(this.product, this.productIndex);

  @override
  Widget build(BuildContext context){
    return Card(
          child: Column(
            children: <Widget>[
              Image.asset(product['imageUrl']),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                  product['title'],
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.black87,
                    fontFamily: "Carbon"
                  ),
                ),
                SizedBox(
                  width: 8.0
                ),
                PriceTag(product['price'].toString())
                ],
              ),
              SizedBox(
                height: 5.0
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0
                  ),
                  borderRadius: BorderRadius.circular(6.0)
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 6.0,
                    vertical: 4.0
                  ),
                  child: Text(
                  "Union Square, San Francisco"
                )
                )
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.info),
                    color: Theme.of(context).accentColor,
                    onPressed: (){
                      Navigator.pushNamed<bool>(context, '/product/'+productIndex.toString());
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.favorite_border),
                    color: Colors.red,
                    onPressed: (){
                      
                    },
                  )
                ],
              )
            ],
          ),
      );
  }
}