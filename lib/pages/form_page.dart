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
          padding: const EdgeInsets.all(20),
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
              Observer(
                builder: (_) => TextField(
                  onChanged: (value) => store.email = value,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email address',
                    errorText: store.error.email,
                  ),
                )
              ),
              Observer(
                builder: (_) => TextField(
                  onChanged: (value) => store.password = value,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Set a password',
                    errorText: store.error.password,
                  ),
                ),
              ),
              const SizedBox(height: 20),
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
