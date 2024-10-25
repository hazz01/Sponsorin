import 'package:flutter/material.dart';
import 'dart:async';

import 'package:sponsorin/page%20EO/akun/buat-akun-page.dart';

class pemilihanPosisi extends StatefulWidget {
  const pemilihanPosisi({super.key});

  @override
  State<pemilihanPosisi> createState() => _pemilihanPosisiState();
}

class _pemilihanPosisiState extends State<pemilihanPosisi> {
  final List<String> images = [
    'image/background_picture1.png',
    'image/background_picture2.png',
  ];
  int _currentImageIndex = 0;
  Timer? _timer;

  void _startImageLoop() {
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      setState(() {
        _currentImageIndex = (_currentImageIndex + 1) % images.length;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    // Mulai loop gambar saat pertama kali aplikasi dijalankan
    _startImageLoop();
  }

  @override
  void dispose() {
    // Hentikan timer ketika widget dibuang agar tidak ada memory leak
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedSwitcher(
            duration: Duration(seconds: 1), // Durasi transisi
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: Container(
              key: ValueKey<int>(_currentImageIndex),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(images[_currentImageIndex]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            color: Colors.black
                .withOpacity(0.68), // Adjust the opacity value as needed
            child: Padding(
              padding: EdgeInsets.fromLTRB(24, 120, 24, 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "Selamat Datang",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Anda ingin menjadi apa?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Opacity(
                          opacity: 0.85, // Set the desired opacity value here
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(350, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                backgroundColor:
                                    Color.fromRGBO(78, 75, 76, 65)),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BuatAkunEO(),
                                ),
                              );
                            },
                            child: Text(
                              "Event Organizer",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Opacity(
                          opacity: 0.85, // Set the desired opacity value here
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(350, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                backgroundColor:
                                    Color.fromRGBO(78, 75, 76, 65)),
                            onPressed: () {},
                            child: Text(
                              "Sponsor",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
