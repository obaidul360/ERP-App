import "package:flutter/material.dart";

class DetailsPage extends StatelessWidget {
  final String name;
  final String price;
  final String image;

  const DetailsPage({
    super.key,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),

              child: Image.network(
                image,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              name,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(
              price,
              style: const TextStyle(fontSize: 22, color: Colors.blue),
            ),

            const SizedBox(height: 20),

            const Text(
              "This is product details page. "
              "You can show description, rating, reviews, etc.",
              style: TextStyle(fontSize: 18),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () {},

                child: const Text("Buy Now"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
