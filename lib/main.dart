import 'package:flutter/material.dart';

import 'package:camera/camera.dart' as mobile_cams;
//import 'package:camera_macos/camera_macos.dart' as ios_cam;
import 'package:flutter_application_2/camara_music.dart';
// import 'dart:io' show Platform;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await mobile_cams.availableCameras();
  final firstCamera = cameras.first;

  runApp(MyApp(camera: firstCamera));
}
