import 'package:flutter/material.dart';

class ShowDimissable extends StatefulWidget {
  @override
  _ShowDimissableState createState() => _ShowDimissableState();
}

class _ShowDimissableState extends State<ShowDimissable> {
  List<String> demoTests = [
    'Test1',
    'Test2',
    'Test3',
    'Test4',
    'Test5',
    'Test6',
    'Test7',
    'Test8',
    'Test9',
    'Test10'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: demoTests.length,
        itemBuilder: (context, index) => Dismissible(
          background: Container(
            color: Colors.red,
          ),
          onDismissed: (direction) {
            print('leleta at index ==> $index');
          },
          key: Key(demoTests[index]),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              demoTests[index],
            ),
          ),
        ),
      ),
    );
  }
}
