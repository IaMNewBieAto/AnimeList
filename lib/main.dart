import 'package:flutter/material.dart';
import 'FirstPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnimeListXD',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(), // นำไปใช้เป็นหน้าหลัก
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimeListXD'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // จัดให้อยู่กลางหน้าจอ
          children: <Widget>[
            Image.asset(
              'img/allanime.jpg',
              height: 100, // กำหนดขนาดของรูปภาพ
              fit: BoxFit.fill,
            ),
            const Text(
              'MyAnimeList',
              style: TextStyle(
                fontSize: 18,
                color: Colors.blue,
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(height: 20), // เพิ่มพื้นที่ว่างระหว่างวิดเจ็ต
            IconButton(
              icon: const Icon(Icons.double_arrow),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FirstPageHome(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
