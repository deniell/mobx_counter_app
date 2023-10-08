import 'package:mobx/mobx.dart';
import 'package:validators2/validators2.dart';
part 'form_store.g.dart';

class FormStore = _FormStore with _$FormStore;

abstract class _FormStore with Store {
  @observable
  String name = '';

  @observable
  String email = '';

  @observable
  String password = '';

  @action
  void setUsername(String value) {
    name = value;
  }

  @action
  void setEmail(String value) {
    email = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  final FormErrorState error = FormErrorState();

  @observable
  ObservableFuture<bool> _usernameCheck = ObservableFuture.value(true);

  @action
  Future<void> validateUsername(String value) async {
    if (isNull(value)) {
      error.username = 'Cannot be blank';
      return;
    }

    try {
      _usernameCheck = ObservableFuture(checkValidUsername(value));

      error.username = null;

      final isValid = await _usernameCheck;
      if (!isValid) {
        error.username = 'Username cannot be $value';
        return;
      }
    } on Object catch (_) {
      error.username = null;
    }

    error.username = null;
  }

  @action
  void validatePassword(String value) {
    error.password = isNull(value) ? 'Cannot be blank' : null;
  }

  @action
  void validateEmail(String value) {
    error.email = isEmail(value) ? null : 'Not a valid email';
  }

  Future<bool> checkValidUsername(String value) async {
    await Future.delayed(const Duration(seconds: 1));

    return value != 'admin';
  }
}

class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String? username;

  @observable
  String? email;

  @observable
  String? password;

  @computed
  bool get hasError => username != null || email != null || password != null;
}