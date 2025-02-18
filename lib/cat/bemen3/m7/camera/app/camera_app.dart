import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_application_2/cat/bemen3/m7/camera/app/main_page.dart';

class CameraApp extends StatelessWidget {
  final CameraDescription camera;

  const CameraApp({super.key, required this.camera});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(camera: camera),
    );
  }
}
