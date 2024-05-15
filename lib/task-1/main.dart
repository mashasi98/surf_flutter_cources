import 'package:flutter/material.dart';

import 'counter_action.dart';
import 'custom_floating_action.dart';


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


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final int _counter = 0;
  final int _incrementCounts = 0;
  final int _decrementCounts = 0;

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
          CustomFloatingButton(CounterAction.increment,CounterAction.increment.toString(),
               const Icon(Icons.add),_counter,_incrementCounts);

          // setButton(CounterAction.increment, CounterAction.increment.toString(),
          //     const Icon(Icons.add)),
          // setButton(CounterAction.decrement, CounterAction.decrement.toString(),
          //     const Icon(Icons.remove)),
          Text(
            'clicks: $_decrementCounts',
          ),
        ],
      ),
    );
  }
}
