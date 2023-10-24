import 'package:ewj_account_manage/models/product_model.dart';
import 'package:ewj_account_manage/screens/firebase_test_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int productCount = 0;
  int totalSaleCount = 0;
  int totalSaleAmount = 0;
  List<Product> products = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  void addProduct() {
    String name = nameController.text;
    int price = int.tryParse(priceController.text) ?? 0;

    if (name.isNotEmpty && price > 0) {
      setState(() {
        products.add(Product(name, price, productCount));
        nameController.clear();
        priceController.clear();
        totalSaleCount += productCount;
        totalSaleAmount += price;
        productCount = 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EWJ Account Manager'),
        actions: [
          if (kDebugMode)
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FirebaseTestScreen()));
                },
                icon: Icon(Icons.account_balance_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                margin: const EdgeInsets.all(0.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Sale: $totalSaleCount",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "$totalSaleAmount.00৳",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
            SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                  "Quantity: $productCount",
                  style: TextStyle(fontSize: 16.0),
                )),
                ElevatedButton(
                  onPressed: () {
                    if (productCount == 1) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Min Quanitity must be 1"),
                        backgroundColor: Colors.red,
                      ));
                      return;
                    }
                    setState(() {
                      productCount--;
                    });
                  },
                  child: Icon(Icons.remove),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade700),
                ),
                SizedBox(
                  width: 10.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      productCount++;
                    });
                  },
                  child: Icon(Icons.add),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade700),
                )
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            ElevatedButton(
              onPressed: addProduct,
              child: Text('Add Sale'),
              style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 40.0)),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      'Product: ${products[index].name}'
                      '(${products[index].quantity})',
                    ),
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
