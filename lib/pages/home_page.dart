import 'package:flutter/material.dart';
import 'package:mobx_counter_app/pages/counter_page.dart';
import 'package:mobx_counter_app/pages/dice_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
                padding: const EdgeInsets.all(20),
              ),
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => const CounterPage()))
              ),
              child: const Text(
                "Counter page",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 25),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.all(20),
              ),
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => const DicePage()))
              ),
              child: const Text(
                "Dice page",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
