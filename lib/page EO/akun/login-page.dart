import 'package:flutter/material.dart';
import 'dart:async';
import 'package:file_picker/file_picker.dart';
import 'package:sponsorin/auth/pemilihan-posisi.dart';
import 'package:sponsorin/main.dart';
import 'package:sponsorin/page%20EO/akun/buat-akun-page.dart';
import 'package:sponsorin/page%20EO/akun/components.dart';
import 'package:sponsorin/page%20EO/page%20home/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class loginPageEO extends StatefulWidget {
  const loginPageEO({super.key});

  @override
  State<loginPageEO> createState() => _loginPageEOState();
}

class _loginPageEOState extends State<loginPageEO> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _startImageLoop();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  Future<void> _signIn() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (userCredential.user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'An error occurred. Please try again.';
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided.';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  String? _fileName;
  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _fileName = result.files.single.name;
      });
    } else {
      setState(() {
        _fileName = null;
      });
    }
  }

  final List<String> images = [
    'image/background_picture1.png',
    'image/background_picture2.png',
  ];

  int _currentImageIndex = 0;
  Timer? _timer;

  void _startImageLoop() {
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      setState(() {
        _currentImageIndex = (_currentImageIndex + 1) % images.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded,
                color: Colors.white, size: 30),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => pemilihanPosisi()),
              );
            },
          ),
        ),
      ),
      body: Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: Container(
              key: ValueKey<int>(_currentImageIndex),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(images[_currentImageIndex]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black.withOpacity(0.68),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: screenSize.height * 0.05),
                        Text(
                          "Selamat Datang",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: screenSize.width * 0.08,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: screenSize.height * 0.01),
                        Text(
                          "Mari login ke akun anda",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenSize.width * 0.04,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        // SizedBox(height: screenSize.height * 0.05),
                        // RepaintBoundary(
                        //   key: _avatarKey,
                        //   child: RandomAvatar(_randomAvatarSeed, height: screenSize.width * 0.25, width: screenSize.width * 0.25),
                        // ),
                        SizedBox(height: screenSize.height * 0.05),
                        buildTextField("Email", controller: _emailController),
                        PasswordField(controller: _passwordController),
                        SizedBox(
                          height: 200,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (!isKeyboardVisible)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.fromLTRB(24, 20, 24, 50),
                color: Colors.transparent,
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                        minimumSize: Size(300, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: _isLoading ? null : _signIn,
                      child: _isLoading
                          ? CircularProgressIndicator()
                          : Text(
                              "Masuk",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                              ),
                            ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BuatAkunEO()),
                          );
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Belum punya akun?",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
