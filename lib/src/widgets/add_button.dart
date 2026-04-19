import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddButtonScreen extends StatefulWidget {
  const AddButtonScreen({super.key});

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add User")),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.name,
              controller: nameCon,
              decoration: const InputDecoration(
                hintText: "Enter Name",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              keyboardType: TextInputType.emailAddress,
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
                    const SnackBar(content: Text("Please fill all fields")),
                  );
                  return;
                }

                dbRef.push().set({
                  "name": nameCon.text.trim(),
                  "email": emailCon.text.trim(),
                });

                Navigator.pop(context);
              },
              child: const Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}