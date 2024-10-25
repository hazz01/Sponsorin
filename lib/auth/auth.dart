import 'package:flutter/material.dart';
import 'package:sponsorin/auth/pemilihan-posisi.dart';
import 'package:sponsorin/main.dart';
import 'dart:async';

class auth extends StatefulWidget {
  const auth({super.key});

  @override
  State<auth> createState() => _authState();
}

class _authState extends State<auth> {
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
              padding: EdgeInsets.fromLTRB(24, 20, 24, 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Pusatkan isi Column secara vertikal
                      crossAxisAlignment: CrossAxisAlignment
                          .center, // Pusatkan isi Column secara horizontal
                      children: [
                        Text(
                          "Sponsorin",
                          style: TextStyle(
                              fontSize: 48,
                              color: Colors.white,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Cari sponsor untuk acara anda dengan mudah dan cepat",
                          textAlign: TextAlign
                              .center, // Pusatkan teks di dalam batasnya
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                        SizedBox(
                          height: 28,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              backgroundColor:
                                  Color.fromARGB(255, 255, 255, 255),
                              minimumSize: Size(300, 50)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => pemilihanPosisi(),
                              ),
                            );
                          },
                          child: Text(
                            "Mulai",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
