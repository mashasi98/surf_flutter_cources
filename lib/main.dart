import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

enum Action {
  increment,
  decrement,
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _isButtonActive = true;
  int _incrementCounts = 0;
  int _decrementCounts = 0;

  String someString = "";

  void Function()? _setCounterState(Action action) {
    return () {
      setState(() {
        _counter = action == Action.increment ? _counter + 1 : _counter - 1;
      });
      setButtonCondition();
      setClickCount(action);
    };
  }

  void setClickCount(Action action) {
    action == Action.increment ? _incrementCounts += 1 : _decrementCounts += 1;
  }

  FloatingActionButton setButton(
      Action onPressedFunction, String tooltip, Widget child) {
    return FloatingActionButton(
      tooltip: tooltip,
      onPressed:
          _isButtonActive == false && onPressedFunction == Action.decrement
              ? null
              : _setCounterState(onPressedFunction),
      child: child,
    );
  }

  void setButtonCondition() {
    setState(() {
      _isButtonActive = _counter != 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Counting:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            'cliks: $_incrementCounts',
          ),
          setButton(Action.increment, Action.increment.toString(),
              const Icon(Icons.add)),
          setButton(Action.decrement, Action.decrement.toString(),
              const Icon(Icons.remove)),
          Text(
            'clicks: $_decrementCounts',
          ),
        ],
      ),
    );
  }
}
