import 'package:flutter/material.dart';
import 'package:uas_android/absensi.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ApkHome(),
    );
  }
}
