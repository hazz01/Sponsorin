import 'package:flutter/material.dart';

Widget buildTextField(String input,
    {required TextEditingController controller}) {
  return Opacity(
    opacity: 0.85,
    child: Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 22),
      width: 350,
      height: 52,
      child: TextField(
        controller: controller,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromRGBO(78, 75, 76, 65),
          hintText: input,
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w100,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          contentPadding: EdgeInsets.fromLTRB(23, 0, 0, 0),
        ),
      ),
    ),
  );
}

Widget buildUploadField(String? fileName, VoidCallback pickFile) {
  return Opacity(
    opacity: 0.85,
    child: SizedBox(
      width: 350,
      height: 52,
      child: TextField(
        onTap: pickFile,
        readOnly: true,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromRGBO(78, 75, 76, 65),
          hintText: fileName ?? "Dokumen Izin EO",
          hintStyle: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w100,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          contentPadding: const EdgeInsets.fromLTRB(23, 0, 0, 0),
          suffixIcon: const Icon(
            Icons.file_upload_outlined,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}

class PasswordField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordField({Key? key, required this.controller}) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Opacity(
          opacity: 0.85,
          child: SizedBox(
            width: 350,
            height: 52,
            child: TextField(
              controller: widget.controller,
              obscureText: !_isPasswordVisible,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromRGBO(78, 75, 76, 65),
                hintText: "Password",
                hintStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w100,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                contentPadding: const EdgeInsets.fromLTRB(23, 0, 0, 0),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.white,
                  ),
                  onPressed: _togglePasswordVisibility,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget buildCustomButton({
  required String buttonText,
  required String belowText,
  required String status,
  required Widget navigateTo,
  required Widget navigateToStatus,
  required BuildContext context,
  required VoidCallback onPressed,
  required bool isLoading,
}) {
  return Container(
    child: Padding(
      padding: EdgeInsets.fromLTRB(24, 20, 24, 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    minimumSize: Size(300, 50),
                  ),
                  onPressed: isLoading ? null : onPressed,
                  child: isLoading
                      ? CircularProgressIndicator()
                      : Text(
                          buttonText,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                          ),
                        ),
                ),
                SizedBox(height: 15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      belowText,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w200,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => navigateToStatus,
                          ),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          text: status,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
