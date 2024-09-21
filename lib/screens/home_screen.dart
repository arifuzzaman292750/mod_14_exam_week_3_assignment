import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_b7_assignments/models/product.dart';
import 'package:flutter_b7_assignments/screens/add_new_product_screen.dart';
import 'package:flutter_b7_assignments/widgets/product_item.dart';
import 'package:http/http.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> productList = [];
  bool _inProgress = false;

  @override
  void initState() {
    super.initState();
    getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text('Product List'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              onPressed: () {
                getProductList();
              },
              icon: const Icon(Icons.refresh),
            ),
          ),
        ],
      ),
      body: _inProgress
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.separated(
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return ProductItem(
                    product: productList[index],
                    onPressDelete: () {
                      _deleteProduct(productList[index].productId, context);
                      Navigator.pop(context);
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 12);
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const AddNewProductScreen();
              },
            ),
          );
        },
        child: Icon(Icons.add, color: Colors.green[600]),
      ),
    );
  }

  Future<void> getProductList() async {
    _inProgress = true;
    setState(() {});

    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/ReadProduct');
    Response response = await get(uri);
    print(response);
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      productList.clear();
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      for (var item in jsonResponse['data']) {
        Product product = Product(
          productId: item["_id"] ?? '',
          productName: item["ProductName"] ?? '',
          productCode: item["ProductCode"] ?? '',
          productImage: item["Img"] ?? '',
          unitPrice: item["UnitPrice"] ?? '',
          productQuantity: item["Qty"] ?? '',
          totalPrice: item["TotalPrice"] ?? '',
          createdDate: item["CreatedDate"] ?? '',
        );
        productList.add(product);
      }
    }

    _inProgress = false;
    setState(() {});
  }

  Future<void> _deleteProduct(String productId, context) async {

    Uri uri = Uri.parse(
        'http://164.68.107.70:6060/api/v1/DeleteProduct/$productId');
    Response response = await get(uri);

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      getProductList();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product deleted'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Delete product failed! Try again.'),
        ),
      );
    }
  }
}
