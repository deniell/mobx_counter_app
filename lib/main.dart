import 'package:flutter/material.dart';
import 'package:mobx_counter_app/pages/home_page.dart';

void main() {
  runApp(const MobXCounterApp());
}

class MobXCounterApp extends StatelessWidget {
  const MobXCounterApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MobX Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
