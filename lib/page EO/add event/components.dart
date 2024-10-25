import 'package:flutter/material.dart';

class CustomTextArea extends StatelessWidget {
  final String hintText;

  const CustomTextArea({
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25.0), // Add bottom margin here
      child: Stack(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.black45,
                fontSize: 15,
              ),
              contentPadding: const EdgeInsets.all(16),
              filled: true,
              fillColor: Colors.transparent,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: Color.fromRGBO(89, 89, 89, 100)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                borderSide: BorderSide(color: Color.fromRGBO(89, 89, 89, 100)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                borderSide: BorderSide(color: Colors.black87),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildTextAdderTextField({
  required TextEditingController controller,
  required VoidCallback onAddText,
  required String Title,
}) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      hintText: Title,
      suffixIcon: IconButton(
        icon: Icon(
          Icons.add_circle,
          color: Color(0xFF1EAAFD),
        ),
        onPressed: onAddText,
      ),
      hintStyle: TextStyle(
        color: Colors.black45,
        fontSize: 15,
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(color: Color.fromRGBO(89, 89, 89, 1)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(color: Colors.black87),
      ),
    ),
  );
}

Widget buildTextList({
  required List<String> texts,
  required ValueChanged<String> onRemove,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: texts.map((text) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          if (text.isNotEmpty)
            IconButton(
              icon: Icon(Icons.cancel, color: Colors.red),
              onPressed: () => onRemove(text),
            ),
        ],
      );
    }).toList(),
  );
}
