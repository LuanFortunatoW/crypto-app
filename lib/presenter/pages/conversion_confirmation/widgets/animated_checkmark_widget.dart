import 'package:flutter/material.dart';

class AnimatedCheckmarkWidget extends StatefulWidget {
  const AnimatedCheckmarkWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedCheckmarkWidget> createState() =>
      _AnimatedCheckmarkWidgetState();
}

class _AnimatedCheckmarkWidgetState extends State<AnimatedCheckmarkWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(
        milliseconds: 200,
      ),
      vsync: this,
    );
    animation = Tween<double>(
      begin: 10,
      end: 42,
    ).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  AnimationController reduce() {
    animation = Tween<double>(
      begin: 40,
      end: 32,
    ).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation.isCompleted ? controller : reduce(),
      child: Center(
        child: CircleAvatar(
          radius: animation.value,
          backgroundColor: const Color.fromRGBO(214, 255, 223, 1),
          child: Icon(
            Icons.check,
            color: const Color.fromRGBO(12, 95, 44, 1),
            size: animation.value,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
