import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_counter_app/stores/dice_store.dart';
import 'package:provider/provider.dart';

final DiceStore diceStore = DiceStore();

class DicePage extends StatelessWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final diceStore = Provider.of<DiceStore>(context);

    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text(
          'Tap the dice !!!'.toUpperCase(),
          style: const TextStyle(
            fontSize: 16,
            fontFamily: 'Hind',
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: diceStore.roll,
                      child: Observer(
                        builder: (_) => Image.asset('images/dice${diceStore.left}.png'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: diceStore.roll,
                      child: Observer(
                        builder: (_) => Image.asset('images/dice${diceStore.right}.png'),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(50),
                child: Observer(
                  builder: (_) => Text(
                    'Total ${diceStore.total}',
                    style: const TextStyle(
                      fontSize: 30,
                      fontFamily: 'Verdana',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
