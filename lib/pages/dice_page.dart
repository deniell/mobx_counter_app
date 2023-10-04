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

    return Container(
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
            ],
          )
        ],
      ),
    );
  }
}
