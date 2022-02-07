import 'package:flutter/material.dart';
import 'dart:math';

class ImplicitExpansionTile extends StatefulWidget {
  const ImplicitExpansionTile({Key? key}) : super(key: key);

  @override
  _ImplicitExpansionTileState createState() => _ImplicitExpansionTileState();
}

class _ImplicitExpansionTileState extends State<ImplicitExpansionTile> {
  bool _expanded = false;
  double _rotation = .0;

  void _rotate() {
    setState(() {
      _rotation += 1.0 / 2.0;
      _expanded = !_expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyScrollView"),
      ),
      body: Column(children: [
        GestureDetector(
          onTap: () => _rotate(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "My expansion tile 0",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: AnimatedRotation(
                      turns: _rotation,
                      duration: const Duration(milliseconds: 100),
                      child: const Icon(Icons.arrow_drop_down),
                    ),
                  ),
                ],
              ),
              AnimatedAlign(
                alignment:
                    _expanded ? Alignment.topCenter : Alignment.bottomCenter,
                duration: Duration(seconds: 1),
                heightFactor: 0,
                child: Column(
                  children: [
                    Icon(Icons.zoom_out_map_outlined),
                    Text("Lorem ipsum"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
