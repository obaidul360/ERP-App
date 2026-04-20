import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddButtonScreen extends StatefulWidget {
  final String? userKey;
  final String? name;
  final String? email;

  const AddButtonScreen({super.key, this.userKey, this.name, this.email});

  @override
  State<AddButtonScreen> createState() => _AddButtonScreenState();
}

class _AddButtonScreenState extends State<AddButtonScreen> {
  final TextEditingController nameCon = TextEditingController();
  final TextEditingController emailCon = TextEditingController();

  final dbRef = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL:
        "https://erp-apps-6396f-default-rtdb.asia-southeast1.firebasedatabase.app",
  ).ref("users");
  @override
  void initState() {
    super.initState();
    // Edit mode => data pre-fill
    if (widget.userKey != null) {
      nameCon.text = widget.name ?? "";
      emailCon.text = widget.email ?? "";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userKey == null ? "Add User" : "Edit User"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: nameCon,
              decoration: const InputDecoration(
                hintText: "Enter Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: emailCon,
              decoration: const InputDecoration(
                hintText: "Enter Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (nameCon.text.isEmpty || emailCon.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Fill all fields")),
                  );
                  return;
                }
                if (widget.userKey == null) {
                  //ADD
                  dbRef.push().set({
                    "name": nameCon.text.trim(),
                    "email": emailCon.text.trim(),
                  });
                } else {
                  // UPDATE
                  dbRef.child(widget.userKey!).update({
                    "name": nameCon.text.trim(),
                    "email": emailCon.text.trim(),
                  });
                }
                Navigator.pop(context);
              },
              child: Text(widget.userKey == null ? "Add" : "Update"),
            ),
          ],
        ),
      ),
    );
  }
}
