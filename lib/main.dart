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
      body: const Center(
        child: MyButton(),
      ),
    );
  }
}

class MyButton extends StatefulWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton>
    with SingleTickerProviderStateMixin {
  bool isElevated = true;
  bool isAnimating = false;
  late AnimationController _animationController;

  void changeIcon() {
//rebuilds UI with changing icon.
    setState(() {
      isAnimating = !isAnimating;
      isAnimating
          ? _animationController.forward()
          : _animationController.reverse();
    });
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[300],
        boxShadow: isElevated
            ? [
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
              ]
            : [],
      ),
      child: Material(
        shape: const CircleBorder(),
        color: Colors.transparent,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTapDown: (_) {
              setState(() {
                isElevated = false;
              });
            },
            onTapCancel: () {
              setState(() {
                isElevated = true;
              });
            },
            onTapUp: (_) {
              // do button tap operation here
              setState(() {
                isElevated = true;
                changeIcon();
              });
            },
            child: Container(
              width: 300,
              height: 300,
              color: Colors.transparent,
              child: Center(
                child: AnimatedIcon(
                  size: 100,
                  progress: _animationController,
                  icon: AnimatedIcons.add_event,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
