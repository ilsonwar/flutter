import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final nameController = TextEditingController();
  final quantityController = TextEditingController();
  final priceController = TextEditingController();
  List<Map<String, dynamic>> items = [];

  void addItem() {
    String name = nameController.text;
    int quantity = int.tryParse(quantityController.text) ?? 0;
    double price = double.tryParse(priceController.text) ?? 0.0;

    if (name.isNotEmpty && quantity > 0 && price > 0) {
      setState(() {
        items.add({
          'name': name,
          'quantity': quantity,
          'price': price,
        });
        nameController.clear();
        quantityController.clear();
        priceController.clear();
      });
    }
  }

  void navigateToListPage() {
    Navigator.pushNamed(context, '/lista',
        arguments: items); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Compras"),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: navigateToListPage,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nome do Item',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: quantityController,
                  decoration: const InputDecoration(
                    labelText: 'Quantidade',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: priceController,
                  decoration: const InputDecoration(
                    labelText: 'Valor Unitário',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: addItem,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('Cadastrar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
