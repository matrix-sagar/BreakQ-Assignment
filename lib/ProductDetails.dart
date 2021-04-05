import 'ProductInformation.dart';
import 'package:flutter/material.dart';

class Productdetails extends StatelessWidget {
  final Products product;
  Productdetails(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(product.productName),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Product ID: ' + product.productId,
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Product Cost: Rs.' + product.productCost,
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Product Brand: ' + product.productBrand,
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Product Color: ' + product.productColor,
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Product Category: ' + product.productCategory,
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Product Material: ' + product.productMaterial,
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Product Availability: ' + product.productAvailability,
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Product Launch Date: ' + product.productLaunchDate,
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Product Summary: ' + product.productSummary,
                style: TextStyle(fontSize: 18)),
          ],
        ));
  }
}
