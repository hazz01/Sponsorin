import 'package:flutter/material.dart';
import 'package:sponsorin/page%20EO/Page%20deskripsi%20usaha/informasi-usaha.dart';

Widget BuildContainerPanjang({
  required BuildContext context,
  required String imagePath,
  required String title,
  required String sub,
  required String category,
  required String address,
  required String description,
}) {
  return Column(
    children: [
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InformasiUsaha(
                businessName: title,
                category: category,
                address: address,
                description: description,
                imagePath: imagePath,
              ),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                width: 120,
                height: 80,
                margin: EdgeInsets.all(7),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 70),
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      sub,
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 70),
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 15),
              Icon(
                Icons.arrow_forward_ios,
                color: Color.fromRGBO(30, 170, 253, 100),
                size: 20,
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
