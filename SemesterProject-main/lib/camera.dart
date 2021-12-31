import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'index.dart';


import 'package:tflite/tflite.dart';

class Tensorflow extends StatefulWidget {
  @override
  _TensorflowState createState() => _TensorflowState();
}

class _TensorflowState extends State<Tensorflow> {
  List? _outputs;
  File? _image;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _loading = true;

    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model.tflite",
      labels: "assets/labels.txt",
      numThreads: 1,
    );
  }
  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        imageMean: 0.0,
        imageStd: 255.0,
        numResults: 2,
        threshold: 0.2,
        asynch: true
    );
    setState(() {
      _loading = false;
      _outputs = output!;
    });
  }
  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
  Future getImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = File(image.path) ;
    });
    classifyImage(_image!);
  }
  Future getcameraImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = File(image.path);
    });
    classifyImage(_image!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
       backgroundColor: Colors.lightGreen,

         title: Text('Pest Scout',style: TextStyle(color: Colors.white60),),
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
         },),],
     ),
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(
      //     "Tensorflow Lite",
      //     style: TextStyle(color: Colors.white, fontSize: 25),
      //   ),
      //   backgroundColor: Colors.amber,
      //   elevation: 0,
      // ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _loading ? Container(
              height: 300,
              width: 300,
            ):
            Container(
              margin: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _image == null ? Container() : Image.file(_image!),
                  SizedBox(
                    height: 20,

                  ),
                  _image == null ? Container() : _outputs != null ?
                  Text(_outputs![0]["label"],style: TextStyle(color: Colors.black,fontSize: 20),
                  ) : Container(child: Text(""))
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: getcameraImage, //no parenthesis
                    child: Container(
                      width: MediaQuery.of(context).size.width - 200,
                      alignment: Alignment.center,
                      padding:
                      EdgeInsets.symmetric(horizontal: 24, vertical: 17),
                      decoration: BoxDecoration(
                          color: Colors.blueGrey[600],
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        'Take A Photo',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: getImage, //no parenthesis
                    child: Container(
                      width: MediaQuery.of(context).size.width - 200,
                      alignment: Alignment.center,
                      padding:
                      EdgeInsets.symmetric(horizontal: 24, vertical: 17),
                      decoration: BoxDecoration(
                          color: Colors.blueGrey[600],
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        'Pick From Gallery',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // FloatingActionButton(
            //   tooltip: 'Pick Image',
            //   onPressed: getImage,
            //   child: Icon(Icons.add_photo_alternate_sharp,
            //     size: 20,
            //     color: Colors.white,
            //   ),
            //   backgroundColor: Colors.amber,
            // ),
            // Divider(
            //   height: 25,
            //   thickness: 1,
            // ),
            // FloatingActionButton(
            //   tooltip: 'Click Image',
            //   onPressed: getcameraImage,
            //   child: Icon(Icons.camera,
            //     size: 20,
            //     color: Colors.white,
            //   ),
            //
            //   backgroundColor: Colors.amber,
            // ),
          ],
        ),
      ),
    );
  }
}


//import 'image_picker_channel.dart';

//void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Pest Scout App',
//       theme: ThemeData(
//         primarySwatch: Colors.lightGreen,
//       ),
//       home: MyHomePage(title: 'Pest Scout'),
//
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   // MyHomePage({Key key, this.title}) : super(key: key);
//
//   //final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   //final ImagePicker _imagePicker = ImagePickerChannel();
//
//    File? _imageFile=null;
//
//   Future<void> captureImage(ImageSource imageSource) async {
//     try {
//       final imageFile = await ImagePicker.pickImage(source: imageSource);
//       setState(() {
//         _imageFile = imageFile;
//       });
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   Widget _buildImage() {
//     if (_imageFile != null) {
//       return Image.file(_imageFile!);
//     } else {
//       return Text('Take an image to start', style: TextStyle(fontSize: 18.0));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.lightGreen,
//
//         title: Text('Pest Scout',style: TextStyle(color: Colors.white60),),
//         actions: <Widget>[
//       IconButton(
//       icon: Icon(
//         Icons.close_rounded,
//         color: Colors.white60,
//       ),
//         onPressed: () {
//           setState(() {
//             Navigator.pop(context,
//                 MaterialPageRoute(builder: (context) => InputPage()));
//           });
//         },),],
//     ),
//       body: Column(
//         children: [
//           Expanded(child: Center(child: _buildImage())),
//           _buildButtons(),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildButtons() {
//     return ConstrainedBox(
//         constraints: BoxConstraints.expand(height: 80.0),
//         child: Row(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: <Widget>[
//               _buildActionButton(
//                 key: Key('retake'),
//                 text: 'Photos',
//                 onPressed: () => captureImage(ImageSource.gallery),
//               ),
//               _buildActionButton(
//                 key: Key('upload'),
//                 text: 'Camera',
//                 onPressed: () => captureImage(ImageSource.camera),
//               ),
//             ]));
//   }
//
//   Widget _buildActionButton({required Key key, required String text, required Function onPressed}) {
//     return Expanded(
//       child: FlatButton(
//           key: key,
//           child: Text(text, style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,)),
//           shape: RoundedRectangleBorder(),
//           color: Colors.lightGreen,
//           textColor: Colors.black,
//           onPressed: (){}),
//     );
//   }
// }
