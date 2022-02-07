import 'package:flutter/material.dart';

class ImplicitFloatingButton extends StatefulWidget {
  const ImplicitFloatingButton({Key? key}) : super(key: key);

  @override
  _ImplicitFloatingButtonState createState() => _ImplicitFloatingButtonState();
}

class _ImplicitFloatingButtonState extends State<ImplicitFloatingButton> {
  bool _withAnimatedContainers = true;
  bool _expanded = false;
  double _scaleX = 1.0;
  double _scaleY = 1.0;
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
      body: _withAnimatedContainers
          ? GestureDetector(
              onTap: () {
                setState(() {
                  if (_expanded) {
                    _scaleX++;
                    _scaleY += 2;
                    _width -= 50;
                    _rounded = 100;
                  } else {
                    _scaleX--;
                    _scaleY -= 2;
                    _width += 50;
                    _rounded = 0;
                  }
                  _expanded = !_expanded;
                });
              },
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                alignment: Alignment(_scaleX, _scaleY),
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
            )
          : Stack(
              children: [
                AnimatedPositioned(
                  width: _expanded ? 40 : 90,
                  height: _height,
                  right: _expanded ? 15 : 150,
                  bottom: _expanded ? 15 : 500,
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _expanded = !_expanded;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius:
                                BorderRadius.circular(_expanded ? 100 : 0)),
                      )),
                  duration: Duration(seconds: 1),
                ),
              ],
            ),
    );
  }
}
