import 'package:flutter/material.dart';
import 'package:mobx_counter_app/stores/counter_store.dart';

final counterStore = CounterStore();

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "0",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "+",
        onPressed: () => null,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
