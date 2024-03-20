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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  bool state = true;
  late final AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
      lowerBound: 0.5,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
            ScaleTransition(
              scale: _animationController,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.red,
              ),
            ),
            AnimatedContainer(
              width: state ? 100 : 200,
              height: state ? 100 : 200,
              color: state ? Colors.blue : Colors.cyan,
              duration: const Duration(seconds: 3),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _animationController.repeat();
          // if (state) {
          //   _animationController.forward();
          // } else {
          //   _animationController.reverse();
          // }
          setState(() {
            state = !state;
          });
        },
        child: const Icon(Icons.change_circle_outlined),
      ),
    );
  }
}
