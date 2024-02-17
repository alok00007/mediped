import 'package:flutter/material.dart';

void main() {
  runApp(RotatingCubeApp());
}

class RotatingCubeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Rotating Cube'),
        ),
        body: Center(
          child: RotatingCube(),
        ),
      ),
    );
  }
}

class RotatingCube extends StatefulWidget {
  @override
  _RotatingCubeState createState() => _RotatingCubeState();
}

class _RotatingCubeState extends State<RotatingCube>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 12),
    )..repeat();

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.002) // perspective
            ..rotateX(0.3) // tilt cube slightly for a 3D effect
            ..rotateY(_animation.value * 2 * 3.14), // Y rotation
          alignment: FractionalOffset.center,
          child: Container(
            width: 200,
            height: 200,
            child: Stack(
              children: [
                CubeFace(color: Colors.red.withOpacity(0.7)),
                Positioned(
                  left: 100,
                  child: CubeFace(color: Colors.orange.withOpacity(0.7), rotateY: 90),
                ),
                Positioned(
                  top: 100,
                  child: CubeFace(color: Colors.blue.withOpacity(0.7), rotateX: 90),
                ),
                Positioned(
                  right: 100,
                  child: CubeFace(color: Colors.green.withOpacity(0.7), rotateY: -90),
                ),
                Positioned(
                  bottom: 100,
                  child: CubeFace(color: Colors.yellow.withOpacity(0.7), rotateX: -90),
                ),
                Positioned(
                  top: 100,
                  child: Center(child: CubeFace(color: Colors.purple.withOpacity(0.7), rotateZ: 90)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class CubeFace extends StatelessWidget {
  final Color color;
  final double rotateX;
  final double rotateY;
  final double rotateZ;

  const CubeFace({
    required this.color,
    this.rotateX = 0,
    this.rotateY = 0,
    this.rotateZ = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..rotateX(rotateX * 3.14 / 180)
        ..rotateY(rotateY * 3.14 / 180)
        ..rotateZ(rotateZ * 3.14 / 180),
      alignment: Alignment.center,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: color,
        ),
        child: Center(
          child: Text(
            'Face',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
