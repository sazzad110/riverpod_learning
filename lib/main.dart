/*
Appbar i added refresh button , when click it the conter value will be set to zero
*/

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
    final count = ref.watch(counterProvier);  // used to observer provider state in build method whenveer provier val change it rebuilds the widget.

    ref.listen(counterProvier,((previous,next) {
      if(next == 5) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Alert ! the value is $next")));
      }
    }
    ));

    return Scaffold(
      appBar: AppBar(
        title: Text("State Provider"),
        actions: [
          IconButton(onPressed: (){
            //ref.invalidate(counterProvier);
            ref.refresh(counterProvier);

          }, icon: Icon(Icons.refresh))
        ],
      ),
      body: Center(
          child: Text(
        count.toString(),
        style: TextStyle(fontSize: 30),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvier.notifier).state++;  // observed/read provider val once
        
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
