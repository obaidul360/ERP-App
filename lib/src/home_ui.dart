import 'package:erp_app/src/widgets/add_button.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HomeUiScreen extends StatefulWidget {
  const HomeUiScreen({super.key});

  @override
  State<HomeUiScreen> createState() => _HomeUiScreenState();
}

class _HomeUiScreenState extends State<HomeUiScreen> {
  final dbRef = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL:
    "https://erp-apps-6396f-default-rtdb.asia-southeast1.firebasedatabase.app",
  ).ref("users");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User List")),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddButtonScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),

      body: StreamBuilder<DatabaseEvent>(
        stream: dbRef.onValue,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.snapshot.value == null) {
            return const Center(child: Text("No Data Found"));
          }

          final data = Map<dynamic, dynamic>.from(
            snapshot.data!.snapshot.value as Map,
          );

          final list = data.entries.toList();

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final item =
              Map<String, dynamic>.from(list[index].value);

              return Card(
                child: ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(item["name"] ?? "No Name"),
                  subtitle: Text(item["email"] ?? "No Email"),
                ),
              );
            },
          );
        },
      ),
    );
  }
}