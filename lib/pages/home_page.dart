import 'package:flutter/material.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int cartCount = 0;
  String searchText = '';

  final List<Map<String, String>> products = [
    {
      'name': 'Laptop',
      'price': '\$1200',
      'description': 'A powerful laptop suitable for study, projects and daily work.'
    },
    {
      'name': 'Headphones',
      'price': '\$120',
      'description': 'Wireless headphones with high sound quality.'
    },
    {
      'name': 'Smartwatch',
      'price': '\$220',
      'description': 'Smartwatch with activity tracking and notifications.'
    },
    {
      'name': 'Mouse',
      'price': '\$40',
      'description': 'Ergonomic and precise wireless mouse.'
    },
    {
      'name': 'Keyboard',
      'price': '\$70',
      'description': 'Comfortable and stylish keyboard.'
    },
    {
      'name': 'Smartphone',
      'price': '\$900',
      'description': 'Modern smartphone with high performance.'
    },
  ];

  @override
  Widget build(BuildContext context) {

    final filteredProducts = products.where((product) {
      return product['name']!
          .toLowerCase()
          .contains(searchText.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mini Catalog"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                const Icon(Icons.shopping_cart),
                const SizedBox(width: 5),
                Text(
                  cartCount.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),

      body: Column(
        children: [

          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade100,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              "Welcome!\nExplore our tech products.",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search product...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GridView.builder(
                itemCount: filteredProducts.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.78,
                ),
                itemBuilder: (context, index) {

                  final product = filteredProducts[index];

                  return InkWell(
                    borderRadius: BorderRadius.circular(16),

                    onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            name: product['name']!,
                            price: product['price']!,
                            description: product['description']!,
                            onAddToCart: () {
                              setState(() {
                                cartCount++;
                              });
                            },
                          ),
                        ),
                      );

                    },

                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          const Icon(Icons.devices, size: 42),

                          const SizedBox(height: 10),

                          Text(
                            product['name']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(height: 6),

                          Text(
                            product['price']!,
                            style: const TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 10),

                          const Text(
                            "View details",
                            style: TextStyle(fontSize: 12),
                          )

                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

        ],
      ),
    );
  }
}