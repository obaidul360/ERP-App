class TestModel {
  String name;
  String subtitle;
  double id;

  TestModel({required this.name, required this.subtitle, required this.id});
  factory TestModel.fromJson(Map<String, dynamic> json) {
    return TestModel(id: json['id'], subtitle: json['title'], name: 'id');
  }
}
