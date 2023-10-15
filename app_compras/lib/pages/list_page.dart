import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  final List<Map<String, dynamic>> items;

  const ListPage({Key? key, required this.items}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late List<Map<String, dynamic>> items;

  @override
  Widget build(BuildContext context) {

    items = ModalRoute.of(context)!.settings.arguments as List<Map<String, dynamic>>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Itens'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length, 
              itemBuilder: (context, index) {
                final item = items[index];
                final itemName = item['name'];
                final itemQuantity = item['quantity'];
                final itemPrice = item['price'];
                final itemTotal = itemQuantity * itemPrice;

                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(
                      itemName,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      'Quantidade: $itemQuantity | Valor Unitário: $itemPrice\nTotal: $itemTotal',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            if (itemQuantity > 0) {
                              setState(() {
                                item['quantity'] = itemQuantity - 1;
                              });
                            }
                          },
                        ),
                        Text(itemQuantity.toString()),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              item['quantity'] = itemQuantity + 1;
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              items.removeAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Valor Total: ${calculateTotal().toStringAsFixed(2)}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }

  double calculateTotal() {
    double total = 0.0;
    for (var item in items) {
      double itemQuantity = item['quantity'].toDouble();
      double itemPrice = item['price'].toDouble();

      total += itemQuantity * itemPrice;
    }
    return total;
  }
}
