import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle style;

  const CustomText({
    required this.text,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}

class CustomTextStyles {
  static const TextStyle appBar = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Color.fromARGB(255, 0, 0, 0));

  static const TextStyle title = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: Color.fromARGB(255, 73, 73, 73));

  static const TextStyle titlelight = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Color.fromARGB(255, 73, 73, 73));

  static const TextStyle subtitle = TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: Color.fromARGB(255, 73, 73, 73));

  static const TextStyle header = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Color.fromARGB(255, 0, 0, 0));

  static const TextStyle body = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 0, 0, 0),
  );

  static const TextStyle hint = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 75, 75, 75),
  );

  static const TextStyle bodygrey = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: Color(0xFF595959),
  );

  static const TextStyle bodylight = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: Color(0xFF595959),
  );
  // tes

  static const TextStyle textButtonSmall = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w600,
    color: Color.fromARGB(255, 255, 255, 255),
  );

  static const TextStyle textButtonMedium = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 255, 255, 255),
  );

  static const TextStyle textBottomMediumGray = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 73, 73, 73),
  );

  static const TextStyle textButtonLarge = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    color: Color.fromARGB(255, 255, 255, 255),
  );
}
