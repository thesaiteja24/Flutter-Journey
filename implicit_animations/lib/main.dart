import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool state = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Implicit Animations'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              width: state ? 100 : 300,
              height: state ? 100 : 200,
              color: state ? Colors.blue : Colors.cyan,
              duration: const Duration(seconds: 3),
              child: AnimatedPadding(
                padding: EdgeInsets.all(state ? 34 : 8),
                duration: const Duration(seconds: 2),
                child: const Text('Hi'),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            state = !state;
          });
        },
        child: const Icon(Icons.change_circle_outlined),
      ),
    );
  }
}
