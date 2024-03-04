import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/main.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final name = ref.watch(nameProvider);
    return  Scaffold(
      appBar: AppBar(
        title: Text("Riverpod Flutter"),
      ),
      body: Center(child: Text(name)),
    );
  }
}