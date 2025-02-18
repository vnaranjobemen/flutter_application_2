import 'package:flutter/material.dart';
import 'package:camera/camera.dart' as mobile_cams;
import 'package:flutter_application_2/cat/bemen3/m7/camera/camera_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await mobile_cams.availableCameras();
  final firstCamera = cameras.first;

  runApp(CameraApp(camera: firstCamera));
}
