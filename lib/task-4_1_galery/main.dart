import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/task-4_1_galery/data/repository/photo_repository.dart';
import 'package:surf_flutter_cources/task-4_1_galery/presintation/photo_screen.dart';

void main() {
  runApp(const MyApp());
}

final photoRepository =  PhotoRepository();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
        useMaterial3: true,
      ),
      home: const PhotoScreen(),
    );
  }
}