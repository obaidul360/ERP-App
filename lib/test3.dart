import 'package:erp_app/testdetails.dart';
import 'package:flutter/material.dart';

class SearchBarExample extends StatefulWidget {
  const SearchBarExample({super.key});

  @override
  State<SearchBarExample> createState() => _SearchBarExampleState();
}

class _SearchBarExampleState extends State<SearchBarExample> {
  List<String> allItems = [
    "Apple",
    "Banana",
    "Orange",
    "Mango",
    "Grapes",
    "Watermelon",
    "Pizza",
    "Cheese",
    "burger",
    "Tacos/Quesadillas",
    "Chicken",
    "Nuggets",
    "Soup(Tomato, Clam Chowder)Caesar Salad",
  ];

  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = allItems;
  }

  final List<Map<String, dynamic>> products = const [
    {
      "name": "iPhone 15",
      "price": "\$999",
      "image": "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9",
    },
    {
      "name": "Laptop",
      "price": "\$1200",
      "image": "https://images.unsplash.com/photo-1496181133206-80ce9b88a853",
    },
    {
      "name": "Headphone",
      "price": "\$200",
      "image": "https://images.unsplash.com/photo-1505740420928-5e560c06d30e",
    },
  ];

  void searchItem(String value) {
    setState(() {
      filteredItems = allItems.where((item) {
        return item.toLowerCase().contains(value.toLowerCase());
      }).toList();
    });
  }

  bool isAnimate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search Bar And Animation Screen")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isAnimate = !isAnimate;
          });
        },

        child: const Icon(Icons.play_arrow),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              onChanged: searchItem,

              decoration: InputDecoration(
                hintText: "Search here...",
                prefixIcon: const Icon(Icons.search),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),

          // List
          Expanded(
            child: ListView.builder(
              itemCount: filteredItems.length,

              itemBuilder: (context, index) {
                return Card(child: ListTile(title: Text(filteredItems[index])));
              },
            ),
          ),
          SizedBox(height: 15),
          Center(
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),

              curve: Curves.easeInOut,

              width: isAnimate ? 250 : 120,
              height: isAnimate ? 250 : 120,

              decoration: BoxDecoration(
                color: isAnimate ? Colors.purple : Colors.orange,

                borderRadius: BorderRadius.circular(isAnimate ? 30 : 5),
              ),
            ),
          ),
          SizedBox(height: 10),
          ListView(
            children: const [
              ListTile(
                leading: CircleAvatar(child: Icon(Icons.person)),

                title: Text("Obaidul Islam"),

                subtitle: Text("Flutter Developer"),

                trailing: Icon(Icons.arrow_forward_ios),

                tileColor: Colors.white,
              ),

              Divider(),

              ListTile(
                leading: Icon(Icons.email),
                title: Text("Email"),
                subtitle: Text("example@gmail.com"),
                trailing: Icon(Icons.send),
              ),

              Divider(),

              ListTile(
                leading: Icon(Icons.phone),
                title: Text("Phone"),
                subtitle: Text("+880123456789"),
                trailing: Icon(Icons.call),
              ),
            ],
          ),
          SizedBox(height: 10),
          ListView.builder(
            itemCount: products.length,

            itemBuilder: (context, index) {
              final product = products[index];

              return Card(
                margin: const EdgeInsets.all(10),

                child: ListTile(
                  leading: Image.network(
                    product["image"],
                    width: 60,
                    fit: BoxFit.cover,
                  ),

                  title: Text(product["name"]),

                  subtitle: Text(product["price"]),

                  trailing: const Icon(Icons.arrow_forward_ios),

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(
                          name: product["name"],
                          price: product["price"],
                          image: product["image"],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
