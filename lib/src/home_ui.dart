import 'package:flutter/material.dart';

class HomeUiScreen extends StatefulWidget {
  const HomeUiScreen({super.key});

  @override
  State<HomeUiScreen> createState() => _HomeUiScreenState();
}

class _HomeUiScreenState extends State<HomeUiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ui Responsive Screen')),
      body: LayoutBuilder(
        builder: (context, constiants) {
          if (constiants.maxWidth < 600) {
            return Text("This is mobile Screen");
          } else {
            return Text("This is Desktop Screen");
          }
        },
      ),
    );
  }
}
