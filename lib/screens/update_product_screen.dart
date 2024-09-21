import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_b7_assignments/models/product.dart';
import 'package:http/http.dart';

class UpdateProductScreen extends StatefulWidget {
  final Product product;
  const UpdateProductScreen({super.key, required this.product});

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  late TextEditingController _pNameTEController = TextEditingController();
  late TextEditingController _uPriceTEController = TextEditingController();
  late TextEditingController _tPriceTEController = TextEditingController();
  late TextEditingController _pImageTEController = TextEditingController();
  late TextEditingController _pCodeTEController = TextEditingController();
  late TextEditingController _pQuantityTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _inProgress = false;

  late Product product;

  @override
  void initState() {
    product = widget.product;
    _pNameTEController = TextEditingController(text: product.productName);
    _uPriceTEController = TextEditingController(text: product.unitPrice);
    _tPriceTEController = TextEditingController(text: product.totalPrice);
    _pImageTEController = TextEditingController(text: product.productImage);
    _pCodeTEController = TextEditingController(text: product.productCode);
    _pQuantityTEController = TextEditingController(text: product.productQuantity);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: const Text('Update Product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _pNameTEController,
                  decoration: InputDecoration(
                    hintText: 'Product Name',
                    hintStyle: TextStyle(color: Colors.blue.shade200),
                    labelText: 'Product Name',
                    labelStyle: const TextStyle(color: Colors.blue),
                    fillColor: Colors.grey[100],
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Update product name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _uPriceTEController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Unit Price',
                    hintStyle: TextStyle(color: Colors.blue.shade200),
                    labelText: 'Unit Price',
                    labelStyle: const TextStyle(color: Colors.blue),
                    fillColor: Colors.grey[100],
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Update unit price';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _tPriceTEController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Total Price',
                    hintStyle: TextStyle(color: Colors.blue.shade200),
                    labelText: 'Total Price',
                    labelStyle: const TextStyle(color: Colors.blue),
                    fillColor: Colors.grey[100],
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Update total price';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _pImageTEController,
                  decoration: InputDecoration(
                    hintText: 'Product Image',
                    hintStyle: TextStyle(color: Colors.blue.shade200),
                    labelText: 'Product Image',
                    labelStyle: const TextStyle(color: Colors.blue),
                    fillColor: Colors.grey[100],
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Update product image';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _pCodeTEController,
                  decoration: InputDecoration(
                    hintText: 'Product Code',
                    hintStyle: TextStyle(color: Colors.blue.shade200),
                    labelText: 'Product Code',
                    labelStyle: const TextStyle(color: Colors.blue),
                    fillColor: Colors.grey[100],
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Update product code';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _pQuantityTEController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Product Quantity',
                    hintStyle: TextStyle(color: Colors.blue.shade200),
                    labelText: 'Product Quantity',
                    labelStyle: const TextStyle(color: Colors.blue),
                    fillColor: Colors.grey[100],
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Update product quantity';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                _inProgress
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.grey[100],
                          fixedSize: const Size.fromWidth(double.maxFinite),
                        ),
                        onPressed: _onTapUpdateProductButton,
                        child: const Text('UPDATE PRODUCT',
                            style: TextStyle(fontSize: 16)),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapUpdateProductButton() {
    if (_formKey.currentState!.validate()) {
      updateProduct();
    }
  }

  Future<void> updateProduct() async {
    _inProgress = true;
    setState(() {});
    Uri uri = Uri.parse(
        'http://164.68.107.70:6060/api/v1/UpdateProduct/${product.productId}');
    Map<String, dynamic> inputData = {
      "Img": _pImageTEController.text,
      "ProductCode": _pCodeTEController.text,
      "ProductName": _pNameTEController.text,
      "Qty": _pQuantityTEController.text,
      "TotalPrice": _tPriceTEController.text,
      "UnitPrice": _uPriceTEController.text,
    };
    Response response = await post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(inputData),
    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product has been updated'),
        ),
      );
      Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Update product failed! Try again'),
        ),
      );
    }

    _inProgress = false;
    setState(() {});
  }

  @override
  void dispose() {
    _pNameTEController.dispose();
    _uPriceTEController.dispose();
    _tPriceTEController.dispose();
    _pImageTEController.dispose();
    _pCodeTEController.dispose();
    _pQuantityTEController.dispose();
    super.dispose();
  }
}
