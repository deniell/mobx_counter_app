import 'dart:math';

import 'package:mobx/mobx.dart';
part 'dice_store.g.dart';

class DiceStore = _DiceStore with _$DiceStore;

abstract class _DiceStore with Store {
  @observable
  int left = Random().nextInt(6) + 1;

  @observable
  int right = Random().nextInt(6) + 1;

  @computed
  int get total => left + right;

  void roll() {
    left = Random().nextInt(6) + 1;
    right = Random().nextInt(6) + 1;
  }
}