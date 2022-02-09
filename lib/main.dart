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
  bool _isElevated = true;
  bool _isAnimating = false;
  late AnimationController _animationController;

  void _changeIcon() {
    _isAnimating = !_isAnimating;
    _isAnimating
        ? _animationController.forward()
        : _animationController.reverse();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[300],
        boxShadow: _isElevated
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
                _isElevated = false;
              });
            },
            onTapCancel: () {
              setState(() {
                _isElevated = true;
              });
            },
            // do button tap operation here
            onTapUp: (_) {
              setState(() {
                _isElevated = true;
                _changeIcon();
              });
            },
            child: Container(
              width: 300,
              height: 300,
              color: Colors.transparent,
              child: Center(
                child: AnimatedIcon(
                  size: 200,
                  progress: _animationController,
                  icon: AnimatedIcons.play_pause,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
