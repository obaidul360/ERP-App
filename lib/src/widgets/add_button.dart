import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddButtonScreen extends StatefulWidget {
  const AddButtonScreen({super.key});

  @override
  State<AddButtonScreen> createState() => _AddButtonScreenState();
}

class _AddButtonScreenState extends State<AddButtonScreen> {

  final dbRef = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL: "https://erp-apps-6396f-default-rtdb.asia-southeast1.firebasedatabase.app",
  ).ref("users");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("data push to firebase")),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          FirebaseDatabase db = FirebaseDatabase.instanceFor(
            app: Firebase.app(),
            databaseURL:
                "https://erp-apps-6396f-default-rtdb.asia-southeast1.firebasedatabase.app",
          );
          db.ref("users").push().set({"name": "kamal"});
        },
        child: Icon(Icons.add, size: 35),
      ),
      body: Column(children: [Text("data")]),
    );
  }
}
