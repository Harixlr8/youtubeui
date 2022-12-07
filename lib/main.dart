import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:youtubeui/listconents.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: YoutubeHome(),
      theme:
          ThemeData(brightness: Brightness.dark, primarySwatch: Colors.orange),
    ),
  );
}

class YoutubeHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              child: const FaIcon(
                FontAwesomeIcons.youtube,
                color: Color.fromARGB(255, 187, 26, 14),
                size: 25,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              'YouTube',
              style: GoogleFonts.roboto(),
            ),
          ],
        ),
        actions: [
          Row(
            children: const [
              FaIcon(
                FontAwesomeIcons.chromecast,
                size: 18,
              ),
              SizedBox(
                width: 15,
              ),
              FaIcon(
                FontAwesomeIcons.bell,
                size: 18,
              ),
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.search,
                size: 18,
              ),
              SizedBox(
                width: 15,
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://image.tmdb.org/t/p/w500/vn28J0CYDNrsXSiA7XiCTNTV1m.jpg'),
                radius: 18,
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext, int) {
          Map data = videocontents[int];
          return Container(
            height: 205,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 155,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            data['imagelinks'],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 120,
                      right: 5,
                      child: Container(
                        height: 25,
                        width: 35,
                        decoration: BoxDecoration(color: Colors.black),
                        child: Center(
                          child: Text(
                            data['duration'],
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                      radius: 17,
                      backgroundImage: NetworkImage(
                        data['vloggers'],
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['captions'],
                          style: GoogleFonts.acme(fontSize: 16),
                        ),
                        Text(
                          data['views'],
                          style: GoogleFonts.abel(fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 35,
                    ),
                    const Icon(Icons.more_vert)
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: 4,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedFontSize: 10,
        selectedFontSize: 10,
        iconSize: 20,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.compass), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outlined), label: 'Create'),
          BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions), label: 'Subscriptions'),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_music), label: 'Library'),
        ],
      ),
    );
  }
}
