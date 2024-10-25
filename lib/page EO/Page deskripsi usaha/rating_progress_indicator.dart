import 'package:flutter/material.dart';
import 'package:sponsorin/page%20EO/Page%20deskripsi%20usaha/progress_indicator_and_rating.dart';
import 'package:sponsorin/page%20EO/Page%20deskripsi%20usaha/rating_star.dart';

class TOverallProductRating extends StatelessWidget {
  const TOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "4",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              TRatingBarIndicator(
                rating: 4,
              ),
              SizedBox(height: 10),
              Text(
                "1 Reviews",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 7,
          child: Column(
            children: [
              TRatingProgressIndicator(
                text: "5",
                value: 0,
              ),
              TRatingProgressIndicator(
                text: "4",
                value: 1,
              ),
              TRatingProgressIndicator(
                text: "3",
                value: 0,
              ),
              TRatingProgressIndicator(
                text: "2",
                value: 0,
              ),
              TRatingProgressIndicator(
                text: "1",
                value: 0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
