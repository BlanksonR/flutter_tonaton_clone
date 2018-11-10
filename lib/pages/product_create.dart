  import 'package:flutter/material.dart';


class ProductCreatePage extends StatefulWidget{
  final Function addProduct;

  ProductCreatePage(this.addProduct);
   
  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return _ProductCreatePageState();
    }
}

class _ProductCreatePageState extends State<ProductCreatePage>{

  String titleValue = '';
  String descriptionValue = '';
  double priceValue;

  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.all(10.0) ,
      child: ListView(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            labelText: "Product Title",
          ),
          onChanged:(String title){
            setState(() {
              titleValue = title;       
            });
          },
        ),
        TextField(
          decoration: InputDecoration(
            labelText: "Product Description",
          ),
          maxLines: 4,
          onChanged:(String description){
            setState(() {
              descriptionValue = description;       
            });
          },
        ),
        TextField(
          decoration: InputDecoration(
            labelText: "Product Price"
          ),
          keyboardType: TextInputType.number,
          onChanged:(String price){
            setState(() {
              priceValue = double.parse(price);       
            });
          },
        ),
        SizedBox(
          height: 10.0
        ),
        RaisedButton(
          child: Text("Create Product"),
          color: Theme.of(context).accentColor,
          textColor: Colors.white,
          onPressed: (){
            final Map<String, dynamic> product = {
              'title': titleValue,
              'description': descriptionValue,
              'price': priceValue,
              'imageUrl': 'assets/food.jpg'
            };
            widget.addProduct(product);
            Navigator.pushReplacementNamed(context, '/main');
          }
        )
      ],
    ), 
    );
  }
}