import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider = StateProvider<String>((ref) => "hello sazzad");
void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'Counter App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    ),
  );
}



class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
      ),
      body: Center(child: Consumer(builder: (context, ref, child) {
        final name = ref.watch(nameProvider);
        return Text(name);
      })),
      
      );
  }
}
