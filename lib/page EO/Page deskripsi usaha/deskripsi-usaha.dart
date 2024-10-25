import 'package:flutter/material.dart';

Widget buildDescriptionCard(String description) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Deskripsi Usaha",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          description,
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 14, color: Colors.black54),
        ),
      ],
    ),
  );
}
