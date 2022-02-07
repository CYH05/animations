import 'package:flutter/material.dart';

class ControlledExpansionTile extends StatefulWidget {
  const ControlledExpansionTile({Key? key}) : super(key: key);

  @override
  _ControlledExpansionTileState createState() =>
      _ControlledExpansionTileState();
}

class _ControlledExpansionTileState extends State<ControlledExpansionTile>
    with TickerProviderStateMixin {
  late AnimationController _animationController1;
  late AnimationController _animationController2;
  late Animation<double> _iconRotation1;
  late Animation<double> _iconRotation2;
  late Animation<double> _heightFactor1;
  late Animation<double> _heightFactor2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController1 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _animationController2 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _iconRotation1 =
        Tween<double>(begin: 0.0, end: 3.1).animate(_animationController1);
    _iconRotation2 =
        Tween<double>(begin: 0.0, end: 3.1).animate(_animationController2);
    _heightFactor1 =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController1);
    _heightFactor2 =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController2);
  }

  _animate(int index) {
    if (index == 0) {
      if (_animationController1.value == 0) {
        _animationController1.forward();
      } else {
        _animationController1.reverse();
      }
    } else {
      if (_animationController2.value == 0) {
        _animationController2.forward();
      } else {
        _animationController2.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyScrollView"),
      ),
      body: AnimatedBuilder(
        animation:
            Listenable.merge([_animationController1, _animationController2]),
        builder: (context, child) {
          return Column(
            children: [
              GestureDetector(
                onTap: () => _animate(0),
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
                          child: Transform.rotate(
                            angle: _iconRotation1.value,
                            child: const Icon(Icons.arrow_drop_down),
                          ),
                        ),
                      ],
                    ),
                    ClipRect(
                      child: Align(
                        heightFactor: _heightFactor1.value,
                        child: Column(
                          children: const [
                            Icon(Icons.zoom_out_map_outlined),
                            Text("Lorem ipsum"),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => _animate(1),
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
                          child: Transform.rotate(
                            angle: _iconRotation2.value,
                            child: const Icon(Icons.arrow_drop_down),
                          ),
                        ),
                      ],
                    ),
                    ClipRect(
                      child: Align(
                        heightFactor: _heightFactor2.value,
                        child: Column(
                          children: const [
                            Icon(Icons.zoom_out_map_outlined),
                            Text("Lorem ipsum"),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
