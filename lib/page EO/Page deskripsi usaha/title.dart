import 'package:flutter/material.dart';

Widget title(String title, String categories, String location) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Icon(
              Icons.category_outlined,
              size: 18,
              color: Color.fromRGBO(0, 0, 0, 70),
            ),
            SizedBox(
              width: 2,
            ),
            Text(
              categories,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 18,
              color: Color.fromRGBO(0, 0, 0, 70),
            ),
            SizedBox(
              width: 2,
            ),
            Text(
              location,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500),
            )
          ],
        )
      ],
    ),
  );
}
