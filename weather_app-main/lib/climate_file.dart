import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../util/apifile.dart' as util;
import 'package:http/http.dart' as http;
import 'dart:convert';

class Climate extends StatefulWidget {


  @override
  _ClimateState createState() => _ClimateState();
}

class _ClimateState extends State<Climate> {
  void showStuff() async {
    Map data = await getWeather(util.apiId, util.defaultCity);
    print(data.toString());
  }
  String? _cityEntered;
  Future _goToNextScreen(BuildContext context) async {
    Map? Results = await Navigator.of(context)
    .push(MaterialPageRoute<Map>(builder: (BuildContext context) {
      return new ChangeCity();
    }));
   if(Results !=null && Results.containsKey('enter')){
     _cityEntered= Results['enter'];
  }

  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Climate App'),
      backgroundColor: Colors.red,
      actions: [
        IconButton(onPressed: () {_goToNextScreen(context);}, icon: Icon(Icons.menu))
      ],
    ),
    body: Stack(

      children: <Widget>[
        Center(
          child: Image(
            image: AssetImage('images/c.jpg'),
            height: 6700.0,
            width: 600.0,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          alignment: Alignment.topRight,
          margin: EdgeInsets.fromLTRB(0.0, 10.0, 20.9, 0.0),
          child: Text('${_cityEntered == null ? util.defaultCity :_cityEntered}',
            style: cityStyle(),),

        ),
        Container(
          margin: EdgeInsets.fromLTRB(30.0, 90.0, 0.0, 0.0),
          child: updateTempWidget('${_cityEntered == null ? util.defaultCity :_cityEntered}'),
        )

      ],
    ),
  );
}

Future<Map> getWeather(String apiId, String city) async {
  String apiUrl = 'http://api.openweathermap.org/data/2.5/weather?q=$city&appid='
      '${util.apiId}&units=imperial';
  http.Response response = await http.get(Uri.parse(apiUrl));
  return json.decode(response.body);
}

Widget updateTempWidget(String city) {
  return FutureBuilder(
      future: getWeather(util.apiId, city == null ? util.defaultCity : city),
      builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
        if (snapshot.hasData) {
          Map? content = snapshot.data;
          return Container(
            margin: const EdgeInsets.fromLTRB(30.0, 250.0, 0.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  title: Text(
                    content!['main']['temp'].toString() + "F",
                    style: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontSize: 49.9,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: ListTile(
                    title: Text(
                      "Humaidity: ${content['main']['humidity'].toString()}\n"
                          "Min: ${content['main']['temp_min'].toString()}F\n"
                          "Max: ${content['main']['temp_max'].toString()} F ",
                      style: extraData(),
                    ),
                  ),
                )

              ],
            ),
          );
        }
        else {
          return Container();
        }
      }
  );
}}


class ChangeCity extends StatelessWidget {
  var _cityFieldController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Weather '),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Center(
            child: Image.asset('images/d.jpg',
              width: 590.0,
              height: 6600.0,
              fit: BoxFit.fill,),
          ),
          ListView(
            children: [
              ListTile(
                title: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter City',),
                  controller: _cityFieldController,
                  keyboardType: TextInputType.text,
                ),
              ),
              ListTile(
                title: FlatButton(
                  onPressed: () {
                    Navigator.pop(
                        context, {'enter': _cityFieldController.text});
                  },
                  textColor: Colors.white,
                  color: Colors.redAccent, child: Text("Get Weather"),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

TextStyle cityStyle() {
  return TextStyle(
    color: Colors.white,
    fontSize: 22.9,
    fontStyle: FontStyle.italic,
  );
}

TextStyle extraData() {
  return TextStyle(
      color: Colors.white, fontStyle: FontStyle.normal, fontSize: 17.0);
}