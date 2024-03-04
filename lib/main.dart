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

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {

  @override
  void initState() {
    super.initState();
    final name = ref.read(nameProvider);    // ref communicate with riverpod
    print(name);
  }
  @override
  Widget build(BuildContext context) {

    final name = ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(title: Text("riverpod flutter")),
      body: Center(child: Text(name)),
    );
  }
}