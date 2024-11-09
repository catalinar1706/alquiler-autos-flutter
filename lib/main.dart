import 'package:flutter/material.dart';
import 'package:alquiler_autos/views/Login.dart';
// import 'package:alquiler_autos/menuPrincipal.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alquiler de vehiculos',
      home: Scaffold(
        body: login(),
      ),
    );
  }
}
