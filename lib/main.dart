import 'package:flutter/material.dart';


import './pages/product_admin.dart';
import './pages/products.dart';
import './pages/product.dart';
import './pages/auth.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return _MyAppState();
    }
}

class _MyAppState extends State<MyApp>{

    List<Map<String, dynamic>> _products = [];

    void _addProduct(Map<String, dynamic> product){
    setState(() {
      _products.add(product);
    });
  } 

  void _removeProduct(index){
    setState(() {
      _products.removeAt(index);
    });
  }
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.purple
      ),
      debugShowCheckedModeBanner: false,
      // home: AuthPage(),
      routes: {
        '/': (BuildContext context) => AuthPage(),
        '/main': (BuildContext context) => ProductsPage(_products),
        '/admin': (BuildContext context) => ProductAdmin(_addProduct, _removeProduct),
      },
      onGenerateRoute: (RouteSettings settings){
        final List<String> pathElements = settings.name.split('/');
        if(pathElements[0] != ''){
          return null;
        }
        if(pathElements[1] == 'product'){
          final int index = int.parse(pathElements[2]);

          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProductPage(
              _products[index]['title'], _products[index]['imageUrl'], _products[index]['price'].toString(), _products[index]['description']
            ),
          );
        }

        return null;
      },
      onUnknownRoute: (RouteSettings settings){
        return MaterialPageRoute(
          builder: (BuildContext context) => ProductsPage(_products)
        );
      },
    );
  }
}