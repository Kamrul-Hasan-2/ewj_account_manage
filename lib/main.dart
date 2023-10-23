import 'package:flutter/material.dart';

void main() {
  runApp(EasyWearJunctionApp());
}

class EasyWearJunctionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EWJ Account Manager',
      theme: ThemeData(
        primaryColor: Colors.teal,
      ),
      home: ProductAddScreen(),
    );
  }
}

class ProductAddScreen extends StatefulWidget {
  @override
  _ProductAddScreenState createState() => _ProductAddScreenState();
}

class _ProductAddScreenState extends State<ProductAddScreen> {
  int productCount = 0;
  List<Product> products = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  void addProduct() {
    String name = nameController.text;
    int price = int.tryParse(priceController.text) ?? 0;

    if (name.isNotEmpty && price > 0) {
      setState(() {
        products.add(Product(name, price));
        nameController.clear();
        priceController.clear();
        productCount++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EWJ Account Manager'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Number of Products: $productCount'),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  productCount++;
                });
              },
              child: Text('Number Of Product'),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Product Name'),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Product Price'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: addProduct,
              child: Text('Add Product'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Product: ${products[index].name}'),
                    subtitle: Text('Price: \$${products[index].price}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final int price;

  Product(this.name, this.price);
}
