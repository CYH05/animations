import 'package:animations/controled/expansion_tile.dart';
import 'package:animations/implicits/expansion_tile.dart';
import 'package:flutter/material.dart';

import 'controled/floating_button.dart';
import 'implicits/floating_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _implicitMenuChecked = false;
  bool _controlledMenuChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _implicitMenuChecked = !_implicitMenuChecked;
                        if (_controlledMenuChecked) {
                          _controlledMenuChecked = false;
                        }
                      });
                    },
                    child: const Text("Animações implícitas"),
                  ),
                  ClipRect(
                    child: AnimatedAlign(
                      alignment: _implicitMenuChecked
                          ? Alignment.topCenter
                          : Alignment.bottomCenter,
                      duration: const Duration(milliseconds: 500),
                      heightFactor: _implicitMenuChecked ? 1 : 0,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: RaisedButton(
                              color: Colors.blue,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ImplicitFloatingButton()));
                              },
                              child: const Text(
                                "Floating button",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: RaisedButton(
                              color: Colors.blue,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ImplicitExpansionTile()));
                              },
                              child: const Text(
                                "Scroll view",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _controlledMenuChecked = !_controlledMenuChecked;
                      if (_implicitMenuChecked) _implicitMenuChecked = false;
                    });
                  },
                  child: const Text("Animações controladas"),
                ),
                ClipRect(
                  child: AnimatedAlign(
                    alignment: _controlledMenuChecked
                        ? Alignment.topCenter
                        : Alignment.bottomCenter,
                    duration: Duration(milliseconds: 500),
                    heightFactor: _controlledMenuChecked ? 1 : 0,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: RaisedButton(
                            color: Colors.blue,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ControlledFloatingButton()));
                            },
                            child: const Text(
                              "Floating button",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: RaisedButton(
                            color: Colors.blue,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ControlledExpansionTile()));
                            },
                            child: const Text(
                              "Scroll view",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
