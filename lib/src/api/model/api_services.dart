import 'dart:convert';
import 'package:http/http.dart' as http;

import 'api_model.dart';

Future<List<TestModel>> fetchPosts() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/posts'),
  );

  if (response.statusCode == 200) {
    List data = jsonDecode(response.body);
    return data.map((e) => TestModel.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load data');
  }
}