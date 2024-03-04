import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// creating StateProvider
final counterProvier = StateProvider<int>((ref) => 0);
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

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    final count = ref.watch(counterProvier);
    return Scaffold(
      appBar: AppBar(title: Text("riverpod flutter")),
      body: Center(child: Text(
        count.toString(),
        style: TextStyle(fontSize: 30),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

          ref.read(counterProvier.notifier).state++;
        },
        child: Icon(Icons.add),
      ),

    );
  }
}