import 'package:flutter/material.dart';

class ForTestScreen extends StatefulWidget {
  const ForTestScreen({super.key});

  @override
  State<ForTestScreen> createState() => _ForTestScreenState();
}

class _ForTestScreenState extends State<ForTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("For test")),
      backgroundColor: Colors.blue,
      body: Column(children: [Text("Text"), Text("Body"),

      SizedBox(
        child: Column(
          children: [
            Text("Size Box");
          ],
        ),
      )]),
    );
  }
}
