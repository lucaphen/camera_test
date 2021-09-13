import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // new picture selector
  // image;
  final picker = ImagePicker();

  Future getImageFromGallery() async {
    try {
      var image = await ImagePicker().getImage(source: ImageSource.gallery);

      if (image == null) {
        print('image is null');
        return;
      }

      //XFile? imageTemporary = XFile(image!.path);
      //setState(() => this.image = imageTemporary);

      print("Image path is: ${image.path}");
      return;
    } on PlatformException catch (e) {
      print('Failed to pick image $e');
    }
  }

  void _incrementCounter() async {
    try {
      var pickedFile = await picker.getImage(source: ImageSource.gallery);
      print('pickedFile: $pickedFile');
    } catch (error) {
      print('error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Center(
            //     child: (image != null)
            //         ? Image.file(File(image!.path))
            //         : Container(
            //             height: 150,
            //             width: 150,
            //             child: Icon(
            //               Icons.camera,
            //               size: 40,
            //             ))),
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _incrementCounter();
          //await getImageFromGallery();
          //print('Image selected');
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
