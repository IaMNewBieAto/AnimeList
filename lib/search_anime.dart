import 'package:demofontimage/SecondPage.dart';
import 'package:flutter/material.dart';
import 'AnimeData.dart'; // นำเข้าโมเดล AnimeData ของคุณ
import 'dart:convert'; // สำหรับ json.decode()
import 'package:flutter/services.dart' as rootBundle;

class SearchAnime extends StatefulWidget {
  const SearchAnime({super.key});

  @override
  _SearchAnimeState createState() => _SearchAnimeState();
}

class _SearchAnimeState extends State<SearchAnime> {
  List<AnimeData> allItems = [];
  List<AnimeData> filteredItems = [];
  String searchText = "";

  @override
  void initState() {
    super.initState();
    fetchAnimeData();
  }

  // ฟังก์ชันดึงข้อมูลจาก JSON
  Future<void> fetchAnimeData() async {
    final jsondata = await rootBundle.rootBundle.loadString('data/dataM.json');
    final list = json.decode(jsondata) as List<dynamic>;
    List<AnimeData> animeList = list.map((e) => AnimeData.fromJson(e)).toList();

    setState(() {
      allItems = animeList;
      filteredItems = animeList;
    });
  }

  // ฟังก์ชันกรองรายการตามข้อความค้นหา
  void filterSearchResults(String query) {
    if (query.isNotEmpty) {
      List<AnimeData> dummyList = allItems.where((item) {
        return (item.title?.toLowerCase() ?? "")
                .contains(query.toLowerCase()) ||
            (item.description?.toLowerCase() ?? "")
                .contains(query.toLowerCase());
      }).toList();
      setState(() {
        filteredItems = dummyList;
      });
    } else {
      setState(() {
        filteredItems = allItems;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ค้นหาอนิเมะ'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                filterSearchResults(value); // กรองผลลัพธ์
              },
              decoration: const InputDecoration(
                labelText: "ค้นหาอนิเมะ...",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: ListTile(
                    leading: Image.network(
                        filteredItems[index].imageurl ?? "No image"),
                    title: Text(filteredItems[index].title ?? 'No title'),
                    subtitle: Text(
                        filteredItems[index].description ?? 'No description'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SecondPage(anime: filteredItems[index])),
                      );
                      // คุณสามารถเพิ่มการทำงานเมื่อกดรายการได้ที่นี่
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
