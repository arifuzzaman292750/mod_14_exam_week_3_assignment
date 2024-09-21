import 'package:flutter/material.dart';
import 'package:flutter_b7_assignments/models/product.dart';
import 'package:flutter_b7_assignments/screens/update_product_screen.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final VoidCallback onPressDelete;

  const ProductItem({
    super.key,
    required this.product,
    required this.onPressDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        product.productName,
        style: const TextStyle(fontSize: 18),
      ),
      tileColor: Colors.grey[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product Code: ${product.productCode}'),
          Text('Unit Price: \$${product.unitPrice}'),
          Text('Product Quantity: ${product.productQuantity}'),
          Text('Total Price: \$${product.totalPrice}'),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return UpdateProductScreen(product: product);
                      },
                    ),
                  );
                },
                icon: const Icon(Icons.edit, color: Colors.blue),
                label: const Text('Edit', style: TextStyle(color: Colors.blue)),
              ),
              TextButton.icon(
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: Colors.grey[300],
                        title: const Text('Do you want to delete'),
                        actions: [
                          MaterialButton(
                            onPressed: onPressDelete,
                            child: const Text(
                              'Yes, delete',
                              style: TextStyle(color: Colors.red, fontSize: 16),
                            ),
                          ),
                          MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'No',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.delete, color: Colors.red),
                label:
                    const Text('Delete', style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
