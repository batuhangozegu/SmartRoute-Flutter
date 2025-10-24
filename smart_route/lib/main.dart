import 'package:flutter/material.dart';
import 'package:smart_route/Compenents/list_item_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: Center(
          child: Padding(padding: EdgeInsets.all(20), child: ListItemView()),
        ),
      ),
    );
  }
}
