import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uiapp1/screens/product_overview_screen.dart';

import 'index.dart';

class signUp extends StatefulWidget {


  @override
  _signUpState createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.lightGreen,

          title: Text('SignUp',style: TextStyle(color: Colors.white60),),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.close_rounded,
                color: Colors.white60,
              ),
              onPressed: () {
                setState(() {
                  Navigator.pop(context,
                      MaterialPageRoute(builder: (context) => InputPage()));
                });
              },
            )
          ],
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[

                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Sign in with Email',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(

                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email Address',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,

                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',

                    ),
                  ),
                ),
                SizedBox(height: 15.0,),
                // FlatButton(
                //   onPressed: (){
                //     //forgot password screen
                //   },
                //   textColor: Colors.black87,
                //   child: Text('Forgot Password'),
                // ),
                SizedBox(height: 15.0,),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.lightGreen,
                      child: Text('Create Account'),
                      onPressed: () {
                        setState(() {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ProductOverviewScreen()));
                        });
                      },
                    )),
                SizedBox(height: 15.0,),
                Container(
                    child: Row(
                      children: <Widget>[
                        // Text('Does not have account?'),
                        // FlatButton(
                        //   textColor: Colors.black87,
                        //   child: Text(
                        //     'Sign Up',
                        //     style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        //   ),
                        //   onPressed: () {
                        //     //signup screen
                        //   },
                        // )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ))
              ],
            )));
  }
}
