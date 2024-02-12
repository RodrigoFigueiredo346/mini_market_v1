import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Vendas'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implementar a lógica de pesquisa
            },
          ),
          SizedBox(width: 30),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Implementar a lógica de pesquisa
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(26, (index) {
                final letter = String.fromCharCode('A'.codeUnitAt(0) + index);
                return GestureDetector(
                  onTap: () {
                    // Implementar a lógica para exibir clientes que começam com a letra selecionada
                    debugPrint('Letra selecionada: $letter');
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(letter),
                  ),
                );
              }),
            ),
          ),
          // Adicione aqui a lista de clientes ou a mensagem de nenhum cliente encontrado
        ],
      ),
    );
  }
}
