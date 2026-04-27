import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:http/http.dart';

class ForTestScreen extends StatefulWidget {
  const ForTestScreen({super.key});

  @override
  State<ForTestScreen> createState() => _ForTestScreenState();
}

class _ForTestScreenState extends State<ForTestScreen> {
  Future softInfo() async {
    String name;
    String subName;
    var id;
  }

  Future sumFun() async {
    var a;
    var b;
    var c;
    var sumationIs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "For test",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: Border.all(style: BorderStyle.solid),
        onPressed: () {},
        child: Icon(Icons.add, size: 25, color: Colors.deepPurple),
      ),
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        reverse: true,
        physics: ScrollPhysics(),
        child: Column(
          children: [
            Text("Text"),
            Text("Body"),

            SizedBox(height: 140, child: Column(children: [Text("Size Box")])),
            SizedBox(
              height: 200,
              child: Column(children: [Text("2nd Size Box")]),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 140,
              child: Column(
                children: [
                  Text(
                    "Width ",
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: Column(
                children: [
                  Text(
                    "Test Size Box",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.yellow,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.yellow,width: 4),
                image: DecorationImage(image: AssetImage("assetName"))
              ),
            ),
            SizedBox(height: 10,),
            Row(children: [
              Text("This is row"),
              Text("This"),
            ],)
          ],
        ),
      ),
    );
  }
}
