import 'package:flutter/material.dart';

class ImplicitFloatingButton extends StatefulWidget {
  const ImplicitFloatingButton({Key? key}) : super(key: key);

  @override
  _ImplicitFloatingButtonState createState() => _ImplicitFloatingButtonState();
}

class _ImplicitFloatingButtonState extends State<ImplicitFloatingButton> {
  bool _expanded = false;
  double _width = 40.0;
  double _height = 40.0;
  double _rounded = 100.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Desafio do botão flutuante"),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            if (_expanded) {
              _width = _width - 50;
              _rounded = 100;
            } else {
              _width = _width + 50;
              _rounded = 0;
            }
            _expanded = !_expanded;
          });
        },
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          alignment: _expanded ? Alignment.topCenter : Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(_rounded)),
            ),
          ),
        ),
      ),
    );
  }
}
