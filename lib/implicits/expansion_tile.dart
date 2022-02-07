import 'package:flutter/material.dart';

class ImplicitExpansionTile extends StatefulWidget {
  const ImplicitExpansionTile({Key? key}) : super(key: key);

  @override
  _ImplicitExpansionTileState createState() => _ImplicitExpansionTileState();
}

class _ImplicitExpansionTileState extends State<ImplicitExpansionTile> {
  bool _expanded1 = false;
  bool _expanded2 = false;
  double _rotation1 = .0;
  double _rotation2 = .0;

  void _rotateFirst() {
    setState(() {
      _rotation1 += 1.0 / 2.0;
      _expanded1 = !_expanded1;
    });
  }

  void _rotateSecond() {
    setState(() {
      _rotation2 += 1.0 / 2.0;
      _expanded2 = !_expanded2;
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
          onTap: () => _rotateFirst(),
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
                      turns: _rotation1,
                      duration: const Duration(milliseconds: 100),
                      child: const Icon(Icons.arrow_drop_down),
                    ),
                  ),
                ],
              ),
              ClipRect(
                child: AnimatedAlign(
                  alignment:
                      _expanded1 ? Alignment.topCenter : Alignment.bottomCenter,
                  duration: Duration(milliseconds: 500),
                  heightFactor: _expanded1 ? 1 : 0,
                  child: Column(
                    children: const [
                      Icon(Icons.zoom_out_map_outlined),
                      Text("Lorem ipsum"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => _rotateSecond(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "My expansion tile 1",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: AnimatedRotation(
                      turns: _rotation2,
                      duration: const Duration(milliseconds: 100),
                      child: const Icon(Icons.arrow_drop_down),
                    ),
                  ),
                ],
              ),
              ClipRect(
                child: AnimatedAlign(
                  alignment:
                      _expanded2 ? Alignment.topCenter : Alignment.bottomCenter,
                  duration: Duration(milliseconds: 500),
                  heightFactor: _expanded2 ? 1 : 0,
                  child: Column(
                    children: const [
                      Icon(Icons.zoom_out_map_outlined),
                      Text("Lorem ipsum"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
