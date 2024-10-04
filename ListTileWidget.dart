import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Card in ListView')),
        body: ListView.builder(
          itemCount: 10, // You can specify the number of cards
          itemBuilder: (context, index) {
            return Card(
              color: const Color(0xfff0ead9),
              //borderOnForeground: true,
              elevation: 10,
              margin: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: ListTile(
                  leading: const Icon(Icons.person),
                  title: Text('Card $index'),
                  subtitle: Text('This is card number $index'),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      //  color: Colors.lightBlueAccent,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListItemPage()));
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ListItemPage extends StatelessWidget {
  const ListItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Card in ListView')),
        body: const Center(
          child: Text(
            'Hello, Card in ListView!',
          ),
        ),
      ),
    );
  }
}
