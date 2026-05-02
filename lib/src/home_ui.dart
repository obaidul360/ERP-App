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

  // Delete Confirmation Dialog
  void showDeleteDialog(BuildContext context, String key) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Confirm Delete"),
          content: const Text("Are you sure you want to delete this user?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                dbRef.child(key).remove();
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Deleted Successfully")),
                );
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFB0E743),
        appBar: AppBar(
          backgroundColor: Color(0x5CED8F4F),
          centerTitle: true,
          title: const Text("User List"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AddButtonScreen()),
            );
          },
          child: const Icon(Icons.add),
        ),

        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: StreamBuilder<DatabaseEvent>(
            stream: dbRef.onValue,
            builder: (context, snapshot) {
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
                  final key = list[index].key;
                  final item = Map<String, dynamic>.from(list[index].value);

                  return Card(
                    child: ListTile(
                      tileColor: Color(0xFF4FEDD3),
                      leading: const Icon(Icons.person),
                      title: Text(
                        item["name"] ?? "",
                        style: TextStyle(color: Colors.black),
                      ),
                      subtitle: Text(
                        item["email"] ?? "",
                        style: TextStyle(
                          color: Colors.black,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // EDIT
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => AddButtonScreen(
                                    userKey: key,
                                    name: item["name"],
                                    email: item["email"],
                                  ),
                                ),
                              );
                            },
                          ),

                          // DELETE (with popup)
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              showDeleteDialog(context, key);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
