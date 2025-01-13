import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: 3,
          itemBuilder: (c, i){
            return const ListTile(
              leading: Icon(Icons.person),
              title: Text("홍길동"),
            );
          },
        ),
        bottomNavigationBar: const BottomAppBar(),
        floatingActionButton: FloatingActionButton(
          child: const Text("+"),
          onPressed: (){},
        ),
      ),
    );
  }
}
