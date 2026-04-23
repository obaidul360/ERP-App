import 'package:flutter/material.dart';

import '../api_model/api_model.dart';
import '../api_service/api_services.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<TestModel>> posts;

  @override
  void initState() {
    super.initState();
    posts = fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API Show Data")),
      body: FutureBuilder<List<TestModel>>(
        future: posts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(snapshot.data![index].subtitle));
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("Error"));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
