import 'package:flutter/material.dart';

class ProsesKerjaSama extends StatefulWidget {
  const ProsesKerjaSama({super.key});

  @override
  State<ProsesKerjaSama> createState() => _ProsesKerjaSamaState();
}

class _ProsesKerjaSamaState extends State<ProsesKerjaSama> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF1EAAFD),
        child: Center(
          child: Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('image/mail-check.png'),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Partisipasi anda berhasil, kami akan infokan kepada EO.",
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center, // Center-align the text
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
