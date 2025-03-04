import 'package:flutter/material.dart';
import 'package:w6_homework/traffic_light.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Traffic Light Animation',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const TrafficLightScreen(),
    );
  }
}
