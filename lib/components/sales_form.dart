import 'package:flutter/material.dart';
import 'package:mini_market_v1/models/client_model.dart';
import 'package:mini_market_v1/pages/home_page.dart';
import 'package:mini_market_v1/storage/local_storage.dart';

class SalesForm extends StatefulWidget {
  const SalesForm({Key? key}) : super(key: key);

  @override
  State<SalesForm> createState() => _SalesFormState();
}

class _SalesFormState extends State<SalesForm> {
  final _searchController = TextEditingController();
  final _clientController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final bool _isLoading = false;
  List clients = [];

  void _submit() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
  }

  Future<void> _initClients() async {
    final loadedClients = await LocalStorage.getClients();
    setState(() {
      clients = loadedClients;
    });
  }

  @override
  void initState() {
    super.initState();
    _initClients();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Cadastrar Venda"),
                ],
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8)))),
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      controller: _searchController,
                      validator: (psw) {
                        final password = psw ?? '';
                        if (password.isEmpty || password.length < 5) {
                          return 'Informe uma senha válida';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Cliente'),
                  DropdownMenu<ClientModel>(
                    initialSelection: clients.isNotEmpty ? clients[0] : null,
                    controller: _clientController,
                    label: const Text('Clientes'),
                    dropdownMenuEntries: clients.map<DropdownMenuEntry<ClientModel>>((client) {
                      return DropdownMenuEntry<ClientModel>(
                        value: client,
                        label: client.name,
                      );
                    }).toList(),
                    onSelected: (ClientModel? selectedClient) {
                      if (selectedClient != null) {
                        setState(() {
                          _clientController.text = selectedClient.name;
                        });
                      }
                    },
                  ),
                  const SizedBox(width: 20),
                ],
              ),
              const Spacer(),
              if (_isLoading)
                const CircularProgressIndicator()
              else
                ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 8,
                      ),
                      backgroundColor: const Color.fromRGBO(1, 149, 146, 1),
                      foregroundColor: Colors.white),
                  child: const Text('SALVAR'),
                ),
              TextButton(
                onPressed: () {},
                child: const Text('VOLTAR',
                    style: TextStyle(
                      color: Color.fromRGBO(1, 149, 146, 1),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
