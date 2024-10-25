import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TRatingBarIndicator extends StatelessWidget {
  const TRatingBarIndicator({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: 19,
      unratedColor: Colors.grey[300],
      itemBuilder: (_, __) => Icon(
        Icons.star,
        color: Color(0xFFF8D548),
      ),
    );
  }
}
