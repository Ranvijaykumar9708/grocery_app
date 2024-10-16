import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final List<Product> products = [
    Product(
        name: "Apple",
        image:
            "https://images.pexels.com/photos/209439/pexels-photo-209439.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        price: 1.99,
        discount: 10),
    Product(
        name: "Banana",
        image:
            "https://images.pexels.com/photos/2316466/pexels-photo-2316466.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        price: 0.99,
        discount: 0),
    Product(
        name: "Orange",
        image:
            "https://images.pexels.com/photos/161559/background-bitter-breakfast-bright-161559.jpeg",
        price: 2.99,
        discount: 15),
    Product(
        name: "Tomato",
        image:
            "https://images.pexels.com/photos/1327838/pexels-photo-1327838.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        price: 3.49,
        discount: 5),
  ];

  ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width > 600
                ? 3
                : 2, // Responsive layout
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: () {
                // Handle navigation to product detail page
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.network(product.image, fit: BoxFit.cover),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        product.name,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 14),
                    ),
                    if (product.discount != 0)
                      Text(
                        '${product.discount}% off',
                        style: const TextStyle(color: Colors.red),
                      ),
                    const SizedBox(height: 10),
                    // Only "Add to Cart" Button, now with pink color
                    ElevatedButton(
                      onPressed: () {
                        // Handle Add to Cart
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${product.name} add !')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 218, 141, 167), // Pink color for the button
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                      ),
                      child: const Text('Add'),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final String image;
  final double price;
  final int discount;

  Product({
    required this.name,
    required this.image,
    required this.price,
    this.discount = 0,
  });
}
