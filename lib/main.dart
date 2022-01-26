import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Neumorphism demo'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green,
            boxShadow: [
              // bottom right
              BoxShadow(
                color: Colors.grey.shade500,
                offset: const Offset(5, 5),
                blurRadius: 15,
                spreadRadius: 1,
              ),

              // top left
              const BoxShadow(
                color: Colors.white,
                offset: Offset(-5, -5),
                blurRadius: 13,
                spreadRadius: 1,
              ),
            ],

            // gradient for 3d effect
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.grey.shade200,
                Colors.grey.shade300,
                Colors.grey.shade400,
                Colors.grey.shade500,
              ],
              stops: const [
                0.1,
                0.3,
                0.8,
                0.9,
              ],
            ),
          ),
          child: Material(
            shape: const CircleBorder(),
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              // splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              customBorder: const CircleBorder(),
              child: const SizedBox(
                width: 300,
                height: 300,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
