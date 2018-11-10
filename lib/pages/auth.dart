import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget{
  @override
    State<StatefulWidget> createState() {
      return _AuthPageState();
    }
}

class _AuthPageState extends State<AuthPage>{

  String _emailValue = '';
  String _passwordValue = '';
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context){

    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;

    return Scaffold(
      appBar: AppBar(
        title: Text("Login")
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
            image: AssetImage("assets/background.jpg")
          )
        ),
        padding: EdgeInsets.only(
          top: 50.0,
          left: 10.0,
          right: 10.0
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: targetWidth,
              child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: "Username",
              filled: true,
              fillColor: Colors.white
            ),
            onChanged:(String username){
              _emailValue = username;
            },
          ),
          SizedBox(
            height: 10.9
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Password",
              filled: true,
              fillColor: Colors.white
            ),
            onChanged:(String password){
              _passwordValue = password;
            },
          ),
          SwitchListTile(
            title: Text("Accept Terms"),
            value: _acceptTerms,
            onChanged: (bool value){
              setState(() {
                  _acceptTerms = value;       
                });
            }
          ),
          SizedBox(
            height: 20.0
          ),
         RaisedButton(
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            child: Text("LOGIN"),
            onPressed: (){
              Navigator.pushReplacementNamed(context, '/main');
            }
          )
        ]
      ),
      ),
      ),
      )
      ),
      );
  }
}