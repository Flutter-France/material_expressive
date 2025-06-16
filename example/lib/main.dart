import 'package:flutter/material.dart';
import 'package:material_expressive/material_expressive.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(seedColor: Colors.deepPurple);
    return MaterialApp(
      title: 'Material 3 Expressive Demo',
      theme: ThemeData(
        extensions: [M3ETheme()],
        colorScheme: colorScheme,
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Material 3 Expressive Buttons'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      floatingActionButton: M3EExtendedFloatingActionButton(
        onPressed: () {},
        label: Text('Compose'),
        icon: Icon(Icons.edit),
        scrollController: scrollController,
      ),
      body: ListView.builder(
        controller: scrollController,
        itemBuilder: (context, index) {
          return ListTile(title: Text('Index $index'));
        },
      ),
    );
  }
}
