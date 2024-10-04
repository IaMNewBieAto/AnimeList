import 'package:demofontimage/AnimeData.dart';
import 'package:demofontimage/FirstPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondPage extends StatelessWidget {
  final AnimeData anime;

  const SecondPage({super.key, required this.anime});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // เพิ่ม image.asset ใน AppBar
              Image.asset(
                'img/allanime.jpg',
                height: 40, // กำหนดขนาดของรูปภาพ
                fit: BoxFit.fill,
              ),
              const SizedBox(width: 10), // เพิ่มช่องว่างระหว่างรูปกับข้อความ
              Text(
                'Anime Details',
                style: GoogleFonts.k2d(fontSize: 18),
              ),
            ],
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0), // เพิ่ม padding รอบ ๆ หน้าจอ
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // จัดให้ข้อความชิดซ้าย
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: Image.network(
                    anime.imageurl.toString(),
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.error);
                    },
                  ),
                ),
                const SizedBox(height: 20), // เพิ่มระยะห่างระหว่างรูปกับข้อความ
                Text(
                  'Title : ${anime.title}',
                  style: GoogleFonts.k2d(
                    fontSize: 22,
                  ),
                ),
                Text(
                  'Year : ${anime.year}',
                  style: GoogleFonts.k2d(
                    fontSize: 22,
                  ),
                ),
                Text(
                  'Description : ${anime.description}',
                  style: GoogleFonts.k2d(
                    fontSize: 22,
                  ),
                ),
                Text(
                  'Genres : ${anime.genres}',
                  style: GoogleFonts.k2d(
                    fontSize: 22,
                  ),
                ),
                Text(
                  'Director : ${anime.director}',
                  style: GoogleFonts.k2d(
                    fontSize: 22,
                  ),
                ),
                Text(
                  'Rating : ${anime.rating} stars',
                  style: GoogleFonts.k2d(
                    fontSize: 22,
                  ),
                ),
                ElevatedButton(
                  child: const Text('Back To HomePage'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FirstPageHome()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
