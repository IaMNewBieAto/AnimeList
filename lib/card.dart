import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Car in ListView')),
        body: ListView.builder(
          itemCount: 10, // You can specify the number of cards
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.all(10),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text('Card $index'),
              ),
            );
          },
        ),
      ),
    );
  }
}
