
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 244, 244, 100), // Light background color
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30), // Add space at the top
            // Profile Picture and Name
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.pink[100], // Background color of the avatar
              child: CircleAvatar(
                radius: 45,
                // backgroundImage: AssetImage('assets/profile_image.png'), // Replace with your image
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Haza',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'hazz@gmail.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 30),
            // Profile Options
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.person_outline),
                    title: Text('Profile'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Navigate to profile details
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.history),
                    title: Text('History Event'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Navigate to history event
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.settings_outlined),
                    title: Text('Settings'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Navigate to settings
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Log Out'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Log out logic here
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Profile(),
  ));
}
