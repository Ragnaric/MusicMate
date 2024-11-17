import 'package:flutter/material.dart';

class MusicMate extends StatelessWidget {
  const MusicMate({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Mate',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: const MusicMateView(title: 'Music Mate Home Page'),
    );
  }
}

class MusicMateView extends StatefulWidget {
  const MusicMateView({super.key, required this.title});

  final String title;

  @override
  State<MusicMateView> createState() => _MusicMateViewState();
}

class _MusicMateViewState extends State<MusicMateView> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}