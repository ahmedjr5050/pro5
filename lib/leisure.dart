// ignore_for_file: unused_field, unnecessary_new, library_private_types_in_public_api

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pro5/location.dart';
import 'package:tflite_v2/tflite_v2.dart';

class ImagePickerDemo extends StatefulWidget {
  @override
  _ImagePickerDemoState createState() => _ImagePickerDemoState();
}

class _ImagePickerDemoState extends State<ImagePickerDemo> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  File? file;
  // ignore: prefer_typing_uninitialized_variables
  var _recognitions;
  bool imageRecognized = false; // متغير لتتبع التعرف على الصورة
  var v = "";

  @override
  void initState() {
    super.initState();
    loadmodel().then((value) {
      setState(() {});
    });
  }

  loadmodel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
    );
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = image;
        file = File(image!.path);
      });
      detectimage(file!);
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future detectimage(File image) async {
    int startTime = new DateTime.now().millisecondsSinceEpoch;
    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    if (recognitions != null && recognitions.isNotEmpty) {
      // تم التعرف بنجاح
      setState(() {
        imageRecognized = true;
      });
    } else {
      // لم يتم التعرف على الصورة
      setState(() {
        imageRecognized = false;
      });
    }

    setState(() {
      _recognitions = recognitions;
      v = recognitions.toString();
    });

    int endTime = new DateTime.now().millisecondsSinceEpoch;
    print("Inference took ${endTime - startTime}ms");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green[200],
        title: const Text('Detect Image'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_image != null)
              Image.file(
                File(_image!.path),
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              )
            else
              const Text('No image selected'),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.green,
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MapScreen()));
              },
              child: Text('Location'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: _pickImage,
              child: Text('Pick Image from Gallery'),
            ),
            const SizedBox(height: 20),
            Text(imageRecognized ? 'تم التعرف بنجاح' : ''),
            Text(v.trim()),
          ],
        ),
      ),
    );
  }
}
