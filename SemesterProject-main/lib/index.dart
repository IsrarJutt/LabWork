import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:uiapp1/reusable_class.dart';
import 'image_picker_channel.dart';
import 'camera.dart';
import 'constant.dart';
import 'loginPage.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late DateTime _dateTime;
  late DateTime dateTime2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text('Pest Scout'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.account_circle,
              color: Colors.black87,
            ),
            onPressed: () {
              setState(() {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => login()));
              });
            },
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 20,),
          Expanded(

            child: ReusableCard(
              colour: Colors.lightGreen,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 9.0,
                  ),
                  Image.asset(
                    "images/go-green.jpg",
                    scale: 5.0,
                  ),
                  SizedBox(
                    height: 9.0,
                  ),
                  Text(
                    'Pest Identification',
                    style: kNumberTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Container(
                        height: 30,
                        width: 150,
                        color: Colors.white,

                        child:ElevatedButton.icon(
                          label: Text('Camera',),
                          icon: Icon(Icons.camera_alt_rounded, size: 16),

                          onPressed: () {

                          setState(() {
                          Navigator.push(
                          context, MaterialPageRoute(builder: (context) => Tensorflow()));
                          });
                          },
                        ),)],
                  ),
                ],
              ), onPress: (){},
            ),
          ),
          // Expanded(
          //   child: ReusableCard(
          //     colour: kActiveCardColour,
          //     cardChild: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: <Widget>[
          //         Text(
          //           'Ending Date',
          //           style: kLabelTextStyle,
          //         ),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           crossAxisAlignment: CrossAxisAlignment.baseline,
          //           textBaseline: TextBaseline.alphabetic,
          //           children: <Widget>[],
          //         ),
          //         Text(
          //           dateTime2 == null
          //               ? 'Nothing has been picked yet'
          //               : dateTime2.toString(),
          //           style: kLabelTextStyle,
          //         ),
          //         RaisedButton(
          //           child: Text('Select  date'),
          //           onPressed: () {
          //             showDatePicker(
          //                     context: context,
          //                     initialDate: dateTime2 == null
          //                         ? DateTime.now()
          //                         : dateTime2,
          //                     firstDate: DateTime(2001),
          //                     lastDate: DateTime(2022))
          //                 .then((date) {
          //               setState(() {
          //                 dateTime2 = date;
          //               });
          //             });
          //           },
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
