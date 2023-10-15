import 'package:flutter/material.dart';
import 'package:app_compras/pages/home_page.dart';
import 'package:app_compras/pages/list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Compras',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', 
      routes: {
       '/': (context) => HomePage(), 
        '/lista': (context) => ListPage(items: []),

      },
    );
  }
}
