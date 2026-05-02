import 'dart:math';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.message, size: 60, color: Colors.white),
              SizedBox(height: 10),
              Center(
                child: Text(
                  "Auto Text",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: "Your Name",
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.pink, width: 5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.pink, width: 5),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "Your Phone",
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.yellow, width: 5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.yellow, width: 5),
                  ),
                ),
              ),

              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Your email",
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.red, width: 4),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.red, // Keeps it red when user clicks it
                      width: 4,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      print("obje44444444ct");
                    },
                    icon: Icon(Icons.remove_red_eye),
                  ),
                  hintText: "Your Password",
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.limeAccent, width: 5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.limeAccent, width: 5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
