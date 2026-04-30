import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(title: Text("Auto Text"), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Auto Text",style: TextStyle(fontSize: 25,color: Colors.white),),
            Icon(Icons.message,size: 30,),

          ],
        ),
      ),
    );
  }
}
