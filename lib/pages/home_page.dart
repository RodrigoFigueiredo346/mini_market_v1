import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mini_market_v1/models/sales_models.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedButton = 'Produtos';

  final List<SalesModel> sales = SalesModel.mockProducts();

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
                // buildButton('Produtos'),
                buildButton('CLIENTES'),
                buildButton('VENDAS'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.blueGrey,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Últimas vendas',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: sales.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ListTile(
                    //dense: true,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(sales[index].client),
                        Text(sales[index].value.toString()),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Adicionar Cliente'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Adicionar Venda'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
