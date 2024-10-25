import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:sponsorin/page%20EO/Page%20deskripsi%20usaha/rating_star.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('image/kfc-logo.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'John Doe',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                )
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
          ],
        ),
        SizedBox(
          width: 12,
        ),
        Row(
          children: [
            TRatingBarIndicator(rating: 4),
            SizedBox(
              width: 8,
            ),
            Text(
              "01 NOV, 2024",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: Colors.black54),
            )
          ],
        ),
        SizedBox(
          height: 12,
        ),
        ReadMoreText(
          "The user interface of the app is  quite intuitive. I was able to navigate and make purchases seamlessly. Great job!",
          style: TextStyle(
              color: Color(0xFF595959),
              fontSize: 13,
              fontWeight: FontWeight.w600),
          trimLines: 1,
          trimMode: TrimMode.Line,
          trimExpandedText: "Read less",
          trimCollapsedText: "Read more",
          moreStyle: TextStyle(
              color: Colors.blue, fontSize: 13, fontWeight: FontWeight.w700),
          lessStyle: TextStyle(
              color: Colors.blue, fontSize: 13, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white),
          ),
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "T's Store",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "02 NOV, 2024",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                ReadMoreText(
                  "The user interface of the app is  quite intuitive. I was able to navigate and make purchases seamlessly. Great job!",
                  style: TextStyle(
                      color: Color(0xFF595959),
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: "Read less",
                  trimCollapsedText: "Read more",
                  moreStyle: TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                      fontWeight: FontWeight.w700),
                  lessStyle: TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
