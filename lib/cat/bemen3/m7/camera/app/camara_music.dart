import 'package:flutter/material.dart';
import 'package:camera/camera.dart' as mobile_cams;
import 'package:cross_file/cross_file.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart' as prov;
import 'dart:io' as io;
// import 'dart:io' show Platform;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await mobile_cams.availableCameras();
  final firstCamera = cameras.first;

  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {
  final mobile_cams.CameraDescription camera;

  const MyApp({super.key, required this.camera});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(camera: camera),
    );
  }
}

class MainPage extends StatefulWidget {
  final mobile_cams.CameraDescription camera;

  const MainPage({super.key, required this.camera});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedIndex == 0
            ? 'Càmera'
            : _selectedIndex == 1
                ? 'Picture'
                : 'Music Player'),
      ),
      body: _selectedIndex == 0
          ? CameraScreen(camera: widget.camera)
          : _selectedIndex == 1
              ? const PictureScreen()
              : const MusicPlayerScreen(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Càmera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: 'Picture',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: 'Music',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class CameraScreen extends StatefulWidget {
  final mobile_cams.CameraDescription camera;

  const CameraScreen({super.key, required this.camera});

  @override
  CameraScreenState createState() => CameraScreenState();
}

class CameraScreenState extends State<CameraScreen> {
  late mobile_cams.CameraController _controller;
  late Future<void>
      _initializeControllerFuture; //Para cargar contenido de forma asíncrona

  @override
  void initState() {
    super.initState();
    _controller = mobile_cams.CameraController(
      widget.camera,
      mobile_cams.ResolutionPreset.high,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          //para que ocupe todo el espacio disponible del Column
          flex: 3, //Ocupará 3/4 del espacio disponible
          child: FutureBuilder<void>(
            //Para cargar contenido de forma asíncrona
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return mobile_cams.CameraPreview(_controller);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
        Expanded(
          flex: 1, //Ocupará el otro 1/4 del espacio disponible
          child: Center(
            child: ElevatedButton(
              onPressed: () async {
                try {
                  await _initializeControllerFuture;
                  final image = await _controller.takePicture();
                  final XFile xFile = XFile(image.path);
                  final bytes = await xFile.readAsBytes();

                  // Get the temporary directory
                  final directory = await prov.getExternalStorageDirectory();
                  final String newPath = '${directory?.path}/image.jpg';
                  final io.File newImage = io.File(newPath);
                  await newImage.writeAsBytes(bytes);

                  if (context.mounted) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Photo Taken'),
                        content: Text(
                            'Photo saved at $newPath with ${bytes.length} bytes'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                } catch (e) {
                  print(e);
                }
              },
              style: ElevatedButton.styleFrom(
                //primary: Colors.red,
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(24),
              ),
              child: const Icon(Icons.camera, size: 48),
            ),
          ),
        ),
      ],
    );
  }
}

class PictureScreen extends StatelessWidget {
  const PictureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Picture Screen'),
    );
  }
}

class MusicPlayerScreen extends StatefulWidget {
  const MusicPlayerScreen({super.key});

  @override
  MusicPlayerScreenState createState() => MusicPlayerScreenState();
}

class MusicPlayerScreenState extends State<MusicPlayerScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  void _togglePlayPause() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('musica.mp3'));
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
            iconSize: 64,
            onPressed: _togglePlayPause,
          ),
          Text(_isPlaying ? 'Playing' : 'Paused'),
        ],
      ),
    );
  }
}
