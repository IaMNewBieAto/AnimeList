import 'package:demofontimage/AnimeData.dart';
import 'package:demofontimage/search_anime.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'dart:convert'; // json.decode()
import 'SecondPage.dart';

class FirstPageHome extends StatelessWidget {
  const FirstPageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'AnimeListXD',
            style: GoogleFonts.itim(fontSize: 22, color: Colors.amber[900]),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // ไปยังหน้าค้นหา
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchAnime()),
                );
              },
            ),
          ],
        ),
        body: FutureBuilder(
          future: read_json_data(),
          builder: (context, data) {
            if (data.hasError) {
              return Center(child: Text("${data.error}"));
            } else if (data.hasData) {
              var items = data.data as List<AnimeData>;
              return ListView.builder(
                  // ignore: unnecessary_null_comparison
                  itemCount: items == null ? 0 : items.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: Image(
                                image: NetworkImage(
                                    items[index].imageurl.toString()),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Expanded(
                                child: Container(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8, right: 8),
                                    child: Text(
                                      items[index].title.toString(),
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8, right: 8),
                                    child: Text(
                                        items[index].description.toString()),
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.arrow_forward_ios,
                                      //  color: Colors.lightBlueAccent,
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => SecondPage(
                                                    anime: items[index],
                                                  )));
                                    },
                                  ),
                                ],
                              ),
                            )),
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }

  Future<List<AnimeData>> read_json_data() async {
    final jsondata = await rootBundle.rootBundle.loadString('data/dataM.json');
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => AnimeData.fromJson(e)).toList();
  }
}
