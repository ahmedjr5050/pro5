import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pro5/feature/scan/manage/cubit/cubit/detectimages_cubit.dart';

class ImagePickerDemo extends StatefulWidget {
  const ImagePickerDemo({super.key});

  @override
  _ImagePickerDemoState createState() => _ImagePickerDemoState();
}

class _ImagePickerDemoState extends State<ImagePickerDemo> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  File? file;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _image = image;
          file = File(image.path);
        });
        convertImageToBase64AndSend(file!);
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  void convertImageToBase64AndSend(File image) async {
    final bytes = await image.readAsBytes();
    final base64String = base64Encode(bytes);
    // Send the base64 encoded image to the cubit
    context.read<DetectimagesCubit>().getimagesai(base64String);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detect Images'),
      ),
      body: Center(
        child: SingleChildScrollView(
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
                onPressed: _pickImage,
                child: const Text('Pick Image from Gallery'),
              ),
              const SizedBox(height: 20),
              BlocBuilder<DetectimagesCubit, DetectimagesState>(
                builder: (context, state) {
                  if (state is DetectimagesLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is DetectimagesLoaded) {
                    double score = double.parse(state.aiModels.score);
                    if (score > 0.23) {
                      print('Processed Data: ${state.aiModels.score}');
                      return Text('Processed Data: ${state.aiModels.name}');
                    }
                    if (score < 0.23) {
                      print('Processed Data: ${state.aiModels.score}');
                      return const Text('Processed Data:Unknown');
                    }
                  } else if (state is DetectimagesError) {
                    return Text('Error: ${state.error}');
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
