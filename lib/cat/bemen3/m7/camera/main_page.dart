import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'camera_screen.dart';
import 'picture_screen.dart';
import 'music_player_screen.dart';
import 't_shirt_calculator_sceen.dart';

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
                : _selectedIndex == 2
                    ? 'Music Player'
                    : 'Calculadora de samarretes'),
      ),
      body: _selectedIndex == 0
          ? CameraScreen(camera: widget.camera)
          : _selectedIndex == 1
              ? const PictureScreen()
              : _selectedIndex == 2
                  ? const MusicPlayerScreen()
                  : const TShirtCalculatorScreen(),
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
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'T-Shirts',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
