import 'package:flutter/material.dart';

class ConversionConfirmationPage extends StatefulWidget {
  const ConversionConfirmationPage({Key? key}) : super(key: key);

  @override
  State<ConversionConfirmationPage> createState() =>
      _ConversionConfirmationPageState();
}

class _ConversionConfirmationPageState extends State<ConversionConfirmationPage>
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizeTransition(
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
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Conversão efetuada',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Text(
              'Convevrsão de moeda efetuada com sucesso!',
              style: TextStyle(
                color: Color.fromRGBO(117, 118, 128, 1),
                fontSize: 17,
              ),
            ),
          ],
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
