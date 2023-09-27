import 'package:mobx/mobx.dart';
part 'counter_store.g.dart';

// This is the class used by rest of your codebase
class CounterStore = _CounterStore with _$CounterStore;

abstract class _CounterStore with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}