import 'package:flutter/material.dart';
import 'dart:math' as math;

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: CustomPaint(
        painter: MyPainter(),
        //  To use the entire screen
        size: MediaQuery.of(context).size,
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  // Think of this as paint brush
  // This is where actual painting happens
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint linePaint = Paint()..strokeWidth = 10;
    canvas.drawLine(const Offset(50, 150), const Offset(150, 220), linePaint);
    canvas.drawLine(
        Offset(size.width - 50, 150), Offset(size.width - 150, 220), linePaint);
    Paint circlePaint = Paint();
    canvas.drawCircle(const Offset(100, 250), 20, circlePaint);
    canvas.drawCircle(Offset(size.width - 100, 250), 20, circlePaint);

    Rect rect = const Rect.fromLTWH(105, 350, 220, 300);

    Paint arcPaint = Paint()
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;
    canvas.drawArc(rect, math.pi, math.pi, true, arcPaint);
  }

  @override
  // allows you to define when you want your canvas  to be repainted
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
