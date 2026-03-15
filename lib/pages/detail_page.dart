import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {

  final String name;
  final String price;
  final String description;
  final String image;
  final VoidCallback onAddToCart;

  const DetailPage({
    super.key,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              name,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              price,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.deepPurple,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 16),

            Text(
              description,
              style: const TextStyle(fontSize: 16),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {

                  onAddToCart();

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Product added to cart"),
                    ),
                  );
                },
                icon: const Icon(Icons.shopping_cart),
                label: const Text("Add to Cart"),
              ),
            ),

          ],
        ),
      ),
    );
  }
}