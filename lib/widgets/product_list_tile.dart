import 'package:flutter/material.dart';

class ProductListTile extends StatelessWidget {
  final Map<String, dynamic> product;
  const ProductListTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 8.0),
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Icon(Icons.energy_savings_leaf_outlined),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${product['name'].toString().toUpperCase()}",
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(
                height: 16.0,
              ),
              Row(
                children: [
                  Icon(Icons.shopping_cart_checkout),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    "x ${product['quantity']} ",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              )
            ],
          )),
          Center(
            child: Text(
              "${product['price']}",
              style: TextStyle(fontSize: 20.0, color: Colors.blue.shade600),
            ),
          )
        ],
      ),
    ));
  }
}
