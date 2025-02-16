import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('SVG Viewer')),
        body: const Center(
          child: SvgViewer(),
        ),
      ),
    );
  }
}

class SvgViewer extends StatelessWidget {
  const SvgViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      '''
      <svg xmlns="http://www.w3.org/2000/svg" width="200" height="250" viewBox="0 0 800 1000">
        <path fill-opacity="0.5" fill="#eee" stroke-opacity="0.5" d="M740.8,635.42c-68.27,90.47 -249.77,201.76 -316,240.63a50.7,50.7 0,0 1,-49.93 0.81c-64.19,-35 -234.09,-133.88 -315.65,-242a14.69,14.69 0,0 1,-0.12 -17.49c77.58,-106.29 159.67,-258.89 341.06,-258.89 182,0 242.19,139.08 340.27,258.88A14.62,14.62 0,0 1,740.8 635.42Z"/>
        <path fill="#bdbdbd" d="M704.9,630l-294.29,191.06l0,-340.85l294.29,-191.06l0,340.85z"/>
        <path fill="#e0e0e0" d="M97.59,630l294.29,191.06l0,-340.85l-294.29,-191.06l0,340.85z"/>
        <path fill="#f5f5f5" d="M400.14,464.73l-293.19,-191.45l293.19,-156.31l295.39,156.31l-295.39,191.45z"/>
        <path fill="#eee" d="M106.95,273.28l-9.36,15.87l294.29,191.06l8.26,-15.48l-293.19,-191.45z"/>
        <path fill="#e0e0e0" d="M695.53,273.28l9.37,15.87l-294.29,191.06l-10.47,-15.48l295.39,-191.45z"/>
        <path fill="#eee" d="M391.88,480.21h18.73v340.85h-18.73z"/>
        <path fill="#f5f5f5" d="M400.14,464.73l-8.26,15.48l18.73,0l-10.47,-15.48z"/>
        <path fill="#78c257" d="M397.45,297.62a16.9,28.71 97.07,1 0,4.16 -33.54a16.9,28.71 97.07,1 0,-4.16 33.54z"/>
        <path fill="#78c257" d="M297.17,539.02a30.12,16.11 53.82,1 0,26.01 -19.02a30.12,16.11 53.82,1 0,-26.01 19.02z"/>
        <path fill="#78c257" d="M161.96,588.24a30.12,16.11 53.82,1 0,26.01 -19.02a30.12,16.11 53.82,1 0,-26.01 19.02z"/>
        <path fill="#78c257" d="M551.15,579.45a30.12,16.11 126.18,1 0,35.56 -48.62a30.12,16.11 126.18,1 0,-35.56 48.62z"/>
        <path fill="#78c257" d="M469.12,549.58a30.12,16.11 126.18,1 0,35.56 -48.62a30.12,16.11 126.18,1 0,-35.56 48.62z"/>
        <path fill="#78c257" d="M633.17,609.29a30.12,16.11 126.18,1 0,35.56 -48.62a30.12,16.11 126.18,1 0,-35.56 48.62z"/>
      </svg>
      ''',
      width: 200,
      height: 250,
    );
  }
}
