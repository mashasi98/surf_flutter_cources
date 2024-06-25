import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/task_3_1_theme/presentation/profile_screen.dart';

void main() {
  runApp(const MyCurlingoApp());
}

class MyCurlingoApp extends StatelessWidget {
  const MyCurlingoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const ProfileScreen(),
    );
  }
}
