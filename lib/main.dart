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
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              textDirection: TextDirection.ltr,
              children: [
                containerBuild(bgColor: Colors.yellow, w: 60, h: 100),
                containerBuild(bgColor: Colors.red, w: 60, h: 200),
                containerBuild(bgColor: Colors.green, w: 60, h: 400),
                containerBuild(bgColor: Colors.blue, w: 60, h: 500),
              ],
            ),
          ],
        ),
      ),
    );
  }
}