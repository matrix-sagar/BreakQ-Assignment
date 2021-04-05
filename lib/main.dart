import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'ProductInformation.dart';
import 'ProductDetails.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BreakQ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Products>> fetchData() async {
    String url = "https://6037c52d54350400177235f5.mockapi.io/product";
    final response = await http.get(url);
    var jsonData = json.decode(response.body);

    List<Products> products = [];
    for (var u in jsonData) {
      Products product = Products(
          u["productId"],
          u["productName"],
          u["productCost"],
          u["productBrand"],
          u["productCategory"],
          u["productColor"],
          u["productMaterial"],
          u["productImage"],
          u["productAvailability"],
          u["productLaunchDate"],
          u["productSummary"]);
      products.add(product);
    }
    print(products.length);
    return products;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products Information'),
      ),
      body: Container(
        child: FutureBuilder(
          future: fetchData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                  child: Center(
                child: Text("Fetching Details..."),
              ));
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      snapshot.data[index].productName,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  Productdetails(snapshot.data[index])));
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
