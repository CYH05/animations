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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            child: _implicitMenuChecked
                ? Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _implicitMenuChecked = false;
                          });
                        },
                        child: const Text("Animações implícitas"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey,
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
                                    const ImplicitFloatingButton(),
                              ),
                            );
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
                                      const ImplicitExpansionTile()),
                            );
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
                  )
                : Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _implicitMenuChecked = true;
                            if (_controlledMenuChecked)
                              _controlledMenuChecked = false;
                          });
                        },
                        child: const Text("Animações implícitas"),
                      ),
                    ],
                  ),
          ),
          SizedBox(
            child: _controlledMenuChecked
                ? Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _controlledMenuChecked = false;
                          });
                        },
                        child: const Text("Animações controladas"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey,
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
                                        const ControlledFloatingButton()));
                          },
                          child: const Text(
                            "Flaoting button",
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
                          onPressed: () {},
                          child: const Text(
                            "Scroll view",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _controlledMenuChecked = true;
                            if (_implicitMenuChecked)
                              _implicitMenuChecked = false;
                          });
                        },
                        child: const Text("Animações controladas"),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
