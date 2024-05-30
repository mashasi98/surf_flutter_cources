import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyGestureApp());
}

class MyGestureApp extends StatelessWidget {
  const MyGestureApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const ChangeableWidget(),
    );
  }
}

class ChangeableWidget extends StatefulWidget {
  const ChangeableWidget({Key? key});

  @override
  _ChangeableWidgetState createState() => _ChangeableWidgetState();
}

class _ChangeableWidgetState extends State<ChangeableWidget> {
  bool _isCircle = false;
  double _rotation = 0;
  double _dragY = 0;
  double _dragX = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: <Widget>[
        Positioned.fill(
          top: _dragY,
          left: _dragX,
          child: GestureDetector(
            onTap: _changeWidgetForm,
            onLongPress: _rotateWidget,
            onPanUpdate: _dragWidget,
            child: GestureDetector(
              onTap: _changeWidgetForm,
              onLongPress: _rotateWidget,
              onPanUpdate: _dragWidget,
              child: Transform.rotate(
                angle: _rotation,
                child: Container(
                  margin: const EdgeInsets.all(80),
                  decoration: _buildBoxDecoration(),
                  width: 100,
                  height: 100,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _changeWidgetForm() {
    setState(() {
      _isCircle = !_isCircle;
    });
  }

  BoxDecoration _buildBoxDecoration() {
    return _isCircle ? _buildRectangleImage() : _buildCircleImage();
  }

  BoxDecoration _buildRectangleImage() {
    return const BoxDecoration(
      shape: BoxShape.rectangle,
      image: DecorationImage(
        image: AssetImage('assets/images/task-2/cq.png'),
        fit: BoxFit.contain,
      ),
    );
  }

  BoxDecoration _buildCircleImage() {
    return const BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: AssetImage('assets/images/task-2/circle.png'),
        fit: BoxFit.contain,
      ),
    );
  }

  void _rotateWidget() {
    setState(() {
      _rotation = _rotation + pi / 4;
    });
  }

  void _dragWidget(DragUpdateDetails details) {
    setState(() {
      _dragX += details.delta.dx;
      _dragY += details.delta.dy;
    });
  }
}
