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
  containerBuild(
      {Color bgColor = Colors.yellow,
      double w = 50,
      double h = 50,
      double radius = 0}) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: w,
      height: h,
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(radius)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("AppBar")),
        body: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Alinha os widgets à esquerda
          children: [
            containerBuild(bgColor: Colors.yellow, w: 50, h: 50),
            containerBuild(bgColor: Colors.red, w: 90, h: 50),
            containerBuild(bgColor: Colors.green, w: 150, h: 50),
            containerBuild(bgColor: Colors.blue, w: 200, h: 50),
          ],
        ),
      ),
    );
  }
}
