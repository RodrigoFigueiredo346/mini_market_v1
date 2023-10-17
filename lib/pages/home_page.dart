import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mini_market_v1/models/products_models.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedButton = 'Produtos';

  final List<ProductModel> products = ProductModel.mockProducts();

  Widget buildButton(String buttonText) {
    bool isSelected = buttonText == _selectedButton;
    return Expanded(
      child: SizedBox(
        height: double.infinity,
        child: TextButton(
          onPressed: () {
            setState(() {
              _selectedButton = buttonText;
            });
          },
          style: TextButton.styleFrom(
            backgroundColor: isSelected ? Colors.black12 : Colors.transparent,
          ),
          child: Text(
            buttonText,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        title: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: AppBar().preferredSize.height * 0.7,
                child: TextFormField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search, color: Colors.white),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                  onChanged: (text) {
                    // Handle search text changes
                  },
                ),
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.logout),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
            child: Row(
              children: [
                buildButton('Produtos'),
                buildButton('Clientes'),
                buildButton('Vendas'),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  dense: true,
                  title: Text(products[index].name),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Quantidade: ${products[index].quantity} ${products[index].unit}'),
                      Text('Vencimento: ${DateFormat('dd/MM/yyyy').format(products[index].expirationDate)}'),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
