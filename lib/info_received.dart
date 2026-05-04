import 'package:flutter/material.dart';

class InfoReceivedScreen extends StatelessWidget {
  final String name;
  final String email;
  const InfoReceivedScreen({super.key, required this.name,required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Info Received"),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Password: $name",style: TextStyle(fontSize: 25),),
          SizedBox(height: 10,),
          Text("Email: $email")
        ],
      ),
    );
  }
}
