import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

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
      body: const Align(alignment: Alignment.topCenter, child: Text('Vendas')),
    );
  }
}
