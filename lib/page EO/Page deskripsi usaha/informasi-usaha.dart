import 'dart:io';

import 'package:enhanced_url_launcher/enhanced_url_launcher.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/src/client.dart';
import 'package:open_file/open_file.dart';
import 'package:sponsorin/page%20EO/Page%20deskripsi%20usaha/deskripsi-usaha.dart';
import 'package:sponsorin/page%20EO/Page%20deskripsi%20usaha/review.dart';
import 'package:sponsorin/page%20EO/Page%20deskripsi%20usaha/title.dart';
import 'package:sponsorin/page%20EO/page%20home/homepage.dart';
import 'package:sponsorin/style/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:googleapis_auth/auth_io.dart';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'package:googledrivehandler/googledrivehandler.dart';

class InformasiUsaha extends StatefulWidget {
  final String businessName;
  final String category;
  final String address;
  final String description;
  final String imagePath;

  const InformasiUsaha({
    Key? key,
    required this.businessName,
    required this.category,
    required this.address,
    required this.description,
    required this.imagePath,
  }) : super(key: key);

  @override
  State<InformasiUsaha> createState() => _InformasiUsahaState();
}

String? _fileName;
final String myApiKey = "YOUR_API_KEY";

Widget _categoryButton(String text, bool isSelected, VoidCallback onPressed) {
  return GestureDetector(
    onTap: onPressed,
    child: Text(
      text,
      style: TextStyle(
        color: isSelected ? Color(0xFF1EAAFD) : Colors.black54,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
        fontSize: 18,
      ),
    ),
  );
}

Widget _getContent(String selectedCategory, String description) {
  if (selectedCategory == "overview") {
    return buildDescriptionCard(description);
  } else if (selectedCategory == "reviews") {
    return buildReviewPage();
  }
  return Container(); // Fallback for any other category
}

String selectedCategory = "overview";
void _showAddTaskOptions(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(16),
        height: 150,
        child: GridView.count(
          crossAxisCount: 3, // Menampilkan dalam 3 kolom
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildOption(context, 'image/AI-gen.png', "AI Generate"),
            _buildOption(context, 'image/drive.png', "Google Drive"),
            _buildOption(context, 'image/upload.png', "Upload"),
          ],
        ),
      );
    },
  );
}

Widget _buildOption(
  BuildContext context,
  String imagePath,
  String label,
) {
  return GestureDetector(
    onTap: () async {
      Navigator.pop(context);
      if (label == "AI Generate") {
        // Navigate to the AI Generate Screen
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => AIGenerateScreen()),
        // );

      } else if (label == "Google Drive") {
        // Upload a file to Google Drive using googledrivehandler
        // try {
        //   File? myFile = await GoogleDriveHandler()
        //       .getFileFromGoogleDrive(context: context);
        //   if (myFile != null) {
        //     // Do something with the file, for instance, open the file
        //     await OpenFile.open(myFile.path);
        //     print(myFile.path); // Print the file path for debugging
        //   } else {
        //     // Handle if the user didn't select a file or canceled the operation
        //     ScaffoldMessenger.of(context).showSnackBar(
        //       SnackBar(content: Text('No file selected')),
        //     );
        //   }
        // } catch (error) {
        //   // Handle any errors that occurred during the Google Drive operation
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(content: Text('Error accessing Google Drive: $error')),
        //   );
        // }
      } else if (label == "Upload") {}
    },
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(

              color: Colors.black54, // Border color
              width: 2.0, // Border width
            ),
          ),
          child: ClipOval(
            child: Image.asset(
              imagePath,

              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Text('Failed to load image');
              },

            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}

class _InformasiUsahaState extends State<InformasiUsaha> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [drive.DriveApi.driveFileScope],
  );
  GoogleSignInAccount? _currentUser;
  String _fileName = '';

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Details",
          style: TextStyle(

            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),

        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Container(
            width: 50,
            height: 50,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.black54,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(24, 20, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 360,
                  height: 396,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    // bukan ini
                    child: Image.network(
                      widget.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    _categoryButton(
                      "overview",
                      selectedCategory == "overview",
                      () {
                        setState(() {
                          selectedCategory = "overview";
                        });
                      },
                    ),
                    SizedBox(width: 10),
                    Text(
                      "|",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                    SizedBox(width: 10),
                    _categoryButton(
                      "reviews",
                      selectedCategory == "reviews",
                      () {
                        setState(() {
                          selectedCategory = "reviews";
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 25),
                title(
                  widget.businessName,
                  widget.category,
                  widget.address,
                ),
                SizedBox(height: 25),
                _getContent(selectedCategory, widget.description),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.fromLTRB(24, 15, 24, 15),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: Color(0xFF1EAAFD),
            minimumSize: Size(200, 50),
          ),
          onPressed: () {
            selectedCategory == "overview"
                ? _showAddTaskOptions(context)
                : print("Beri review");
          },
          child: Text(
            selectedCategory == "overview"
                ? "Ajukan kerja sama"
                : "Beri review",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
