import 'package:flutter/material.dart';

class TRatingProgressIndicator extends StatelessWidget {
  const TRatingProgressIndicator({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Text(
                text,
                style: const TextStyle(
                  color: Color(0xFF404040),
                ),
              ),
              SizedBox(width: 5),
              Icon(Icons.star, color: Color(0xFFF8D548), size: 15),
            ],
          ),
        ),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: 20,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 12,
              backgroundColor: Colors.grey[100],
              borderRadius: BorderRadius.circular(7),
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
          ),
        )
      ],
    );
  }
}
