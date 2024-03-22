// import 'package:camera/camera.dart';
// import 'package:get/get.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:tflite_flutter/tflite_flutter.dart';

// class ScanController extends GetxController {
//   late CameraController cameraController;
//   late List<CameraDescription> cameras;

//   var isCameraInitialized = false.obs;
//   var cameraCount = 0;

//   Interpreter? interpreter;
//   bool isTFliteInitialized = false;


//   @override
//   void onInit() {
//     super.onInit();
//     initCamera();
//     initTFlite();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     cameraController.dispose();
//     interpreter?.close();
//   }

//   void initCamera() async {
//     try {
//       if (await Permission.camera.request().isGranted) {
//         cameras = await availableCameras();
//         cameraController =
//             CameraController(cameras[0], ResolutionPreset.max);
//         await cameraController.initialize();
//         cameraController.startImageStream((image) {
//           try {
//             cameraCount++;
//             if (cameraCount % 10 == 0) {
//               cameraCount = 0;
//               detectObjects(image); // Call the object detection method
//             }
//             update();
//           } catch (e) {
//             print('Error processing image stream: $e');
//           }
//         });
//         isCameraInitialized.value = true;
//         update();
//       } else {
//         print('Permission denied');
//       }
//     } catch (e) {
//       print('Error initializing camera: $e');
//     }
//   }
  
//   void initTFlite() async {
//     try {
//       interpreter = await Interpreter.fromAsset(
//         'lib/core/assets/models/model_unquant.tflite',
//       );
//       isTFliteInitialized = true;
//       update();
//     } catch (e) {
//       print('Error initializing TFlite interpreter: $e');
//     }
//   }

//   void detectObjects(CameraImage image) {
//     if (!isTFliteInitialized) {
//       print('TFlite interpreter is not initialized');
//       return;
//     }
    
//     update();
//   }
// }