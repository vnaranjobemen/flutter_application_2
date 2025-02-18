import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'camera_screen.dart';
import 'picture_screen.dart';
import 'music_player_screen.dart';

class MainPage extends StatefulWidget {
  final CameraDescription camera;

  const MainPage({super.key, required this.camera});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
