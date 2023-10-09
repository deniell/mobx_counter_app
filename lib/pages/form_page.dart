import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_counter_app/stores/form_store.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final FormStore store = FormStore();

  @override
  void initState() {
    store.setupValidations();
    super.initState();
  }

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Observer(
                builder: (_) => TextField(
                  onChanged: (value) => store.username = value,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    hintText: 'Pic a username',
                    errorText: store.error.username,
                  ),
                )
              ),
              Observer(
                builder: (_) => AnimatedOpacity(
                  opacity: store.isUserCheckPending ? 1 : 0,
                  duration: const Duration(milliseconds: 300),
                  child: const LinearProgressIndicator()
                ),
              ),
              ElevatedButton(
                onPressed: store.validateAll,
                child: const Text('Sign Up'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
