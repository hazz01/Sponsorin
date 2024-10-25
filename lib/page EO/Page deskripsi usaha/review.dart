import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sponsorin/page%20EO/Page%20deskripsi%20usaha/rating_progress_indicator.dart';
import 'package:sponsorin/page%20EO/Page%20deskripsi%20usaha/rating_star.dart';
import 'package:sponsorin/page%20EO/Page%20deskripsi%20usaha/user_review_card.dart';
import 'package:universal_html/js.dart';

Widget buildReviewPage() {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.white),
          child: Padding(
            padding: EdgeInsets.fromLTRB(12, 18, 10, 18),
            child: Column(
              children: [
                TOverallProductRating(),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 35,
        ),
        UserReviewCard()
      ],
    ),
  );
}
