import 'dart:async';

import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget{

  final String title;
  final String imageUrl;
  final String price;
  final String description;
  ProductPage(this.title, this.imageUrl, this.price, this.description);

  void _showDialogBox(BuildContext context){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Delete Product"),
          content: Text("Are you sure you want to delete product?"),
          actions: <Widget>[
            FlatButton(child: Text('DISCARD'),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text("CONTINUE"),
              onPressed: (){
                Navigator.pop(context);
                Navigator.pop(context, true);
              },
            )
          ]
        );
      }
    );
  }

  @override
    Widget build(BuildContext context) {

      print(imageUrl);
      // TODO: implement build
      return WillPopScope(
        onWillPop: (){
          Navigator.pop(context, false);
          return Future.value(false);
        },
        child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(imageUrl),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(title, style: 
              TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).accentColor
              ),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Union Square, San Francisco',
                  style: TextStyle(
                    fontFamily: 'Carbon',
                    color: Colors.grey,
                    fontSize: 16.0,
                  )
                ),
                SizedBox(width: 8.0,),
                Text(
                  '\$$price',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                    fontFamily: "Carbon"
                  )
                )
              ],
            ),
            Text(
              description,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              child: RaisedButton(
                child: Text("Delete"),
                onPressed: () => _showDialogBox(context),
                color: Theme.of(context).accentColor,
              ),
            )
          ],
        ),
      ),
      );
    }
}