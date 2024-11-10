import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyCounterWidget(),
    );
  }
}

class MyCounterWidget extends StatefulWidget {
  const MyCounterWidget({super.key});

  @override
  State<MyCounterWidget> createState() => _MyCounterWidgetState();
}

class _MyCounterWidgetState extends State<MyCounterWidget> {
  int _counter = 0;
  int _plusClick = 0;
  int _minusClick = 0;
  bool _isButtonEnabled = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
      _plusClick++;
      if (_counter > 0) {
        _isButtonEnabled = true;
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      _minusClick++;
      if (_counter <= 0) {
        _isButtonEnabled = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text("Counter v.2.0",
                style: TextStyle(
                  fontSize: 30,
                )),
            Text(
              '$_counter',
              style: const TextStyle(fontSize: 40),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildClickButton(
                    icon: Icons.add,
                    onPress: _incrementCounter,
                    countClick: _plusClick),
                buildClickButton(
                    icon: Icons.remove,
                    onPress: _isButtonEnabled ? _decrementCounter : null,
                    countClick: _minusClick),
              ],
            )
          ],
        ),
      ),
    );
  }

  Column buildClickButton(
      {required IconData icon,
      required void Function()? onPress,
      required int countClick}) {
    return Column(
      children: [
        FloatingActionButton(
          onPressed: onPress,
          child: Icon(
            icon,
            color: Colors.black,
          ),
        ),
        Text('$countClick', style: const TextStyle(fontSize: 30))
      ],
    );
  }
}
