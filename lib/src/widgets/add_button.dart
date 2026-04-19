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
      appBar: AppBar(title: Text("data push to firebase")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            /// 🔹 Name Field
            TextField(
              controller: nameCon,
              decoration: InputDecoration(
                hintText: "Enter Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 10),

            /// 🔹 Email Field
            TextField(
              controller: emailCon,
              decoration: InputDecoration(
                hintText: "Enter Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 10),

            /// 🔥 Add Button
            ElevatedButton(
              onPressed: () {
                if (nameCon.text.isEmpty || emailCon.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please fill all fields")),
                  );
                  return;
                }

                dbRef.push().set({
                  "name": nameCon.text,
                  "email": emailCon.text,
                });

                nameCon.clear();
                emailCon.clear();
              },
              child: const Text("Add"),
            ),

            const SizedBox(height: 10),

            /// 🔥 Realtime Data Show
            Expanded(
              child: StreamBuilder<DatabaseEvent>(
                stream: dbRef.onValue,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData ||
                      snapshot.data!.snapshot.value == null) {
                    return const Center(child: Text("No Data Found"));
                  }

                  final data = Map<dynamic, dynamic>.from(
                    snapshot.data!.snapshot.value as Map,
                  );

                  final list = data.entries.toList();

                  return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      final item = list[index].value;

                      return Card(
                        child: ListTile(
                          leading: const Icon(Icons.person),
                          title: Text(item["name"].toString()),
                          subtitle: Text(item["email"].toString()),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
