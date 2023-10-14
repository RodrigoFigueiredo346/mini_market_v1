import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mini_market_v1/components/auth_form.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color.fromRGBO(66, 66, 80, 1),
            // decoration: const BoxDecoration(
            //   gradient: LinearGradient(
            //     colors: [
            //       Color.fromRGBO(66, 66, 80, 1),
            //       Color.fromRGBO(66, 66, 80, 1),
            //     ],
            //     begin: Alignment.topLeft,
            //     end: Alignment.bottomRight,
            //   ),
            // ),
          ),
          SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 40, top: 150),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 60,
                      ),
                      // cascade operator
                      //transform: Matrix4.rotationZ(-8 * pi / 180)..translate(-10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 8,
                            color: Colors.black26,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Text(
                        'Mini Market',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const AuthForm(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Exemplo usado para explicar o cascade operator
// void main() {
//   List<int> a = [1, 2, 3];
//   a.add(4);
//   a.add(5);
//   a.add(6);

//   // cascade operator!
//   a..add(7)..add(8)..add(9);

//   print(a);
// }