// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project5/feature/scan/scan.dart';
// class CamerView extends StatelessWidget {
//   const CamerView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GetBuilder <ScanController>(
//         init: ScanController(),
//         builder: (controller) {
//           return controller.isCameraInitialized.value? CameraPreview(controller.cameraController): const Center(
//             child: Text(
//               'Loading Preview.....'
//             ),
//           );
//         }
//       ),
//     );
//   }
// }