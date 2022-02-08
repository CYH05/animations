import 'package:flutter/material.dart';

class ControlledFloatingButton extends StatefulWidget {
  const ControlledFloatingButton({Key? key}) : super(key: key);

  @override
  _ControlledFloatingButtonState createState() =>
      _ControlledFloatingButtonState();
}

class _ControlledFloatingButtonState extends State<ControlledFloatingButton>
    with TickerProviderStateMixin {
  late AnimationController _animateController;
  late Animation<Alignment> _positionController;
  late Animation<Size> _sizeController;
  late Animation<double> _shapeController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animateController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _sizeController =
        Tween<Size>(begin: const Size(40, 40), end: const Size(90, 40))
            .animate(_animateController);

    _positionController =
        Tween<Alignment>(begin: Alignment.bottomRight, end: Alignment.topCenter)
            .animate(_animateController);

    _shapeController =
        Tween<double>(begin: 100, end: 0).animate(_animateController);
  }

  void _animate() {
    if (_animateController.value == 0.0) {
      _animateController.forward();
    } else {
      _animateController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Desafio do botão flutuante"),
      ),
      body: AnimatedBuilder(
        animation: _animateController,
        builder: (context, child) {
          return GestureDetector(
              onTap: _animate,
              child: Align(
                alignment: _positionController.value,
                child: Container(
                  margin: const EdgeInsets.all(15),
                  width: _sizeController.value.width,
                  height: _sizeController.value.height,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(_shapeController.value),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
