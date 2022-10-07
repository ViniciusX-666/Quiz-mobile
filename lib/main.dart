import 'package:flutter/material.dart';
import 'package:quis/views/home_page.dart';
import 'package:quis/views/quiz.dart';
import 'package:quis/views/resultado.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        Resultado.routeName: (context) => Resultado(),
        // '/resultado': (context) => Resultado(),
        '/quiz': (context) => Quiz(),
      },
    );
  }
}
