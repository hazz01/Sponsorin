import 'package:flutter/material.dart';
import 'package:sponsorin/page/homepage.dart';
import 'package:sponsorin/style/textstyle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Color primaryColor = Color(0xFF1EAAFD);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Business App',
      theme: ThemeData(
        primaryColor: primaryColor,
        fontFamily: 'Poppins',
        textTheme: const TextTheme(),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Homepage(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(244, 244, 244, 100),
        type: BottomNavigationBarType.fixed, // Menonaktifkan animasi
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _buildNavItem(0, Icons.home_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildNavItem(1, Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildNavItem(2, Icons.add),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildNavItem(3, Icons.person_outline),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _businessCard(String businessName, String category, Color color) {
    return Card(
      elevation: 3,
      child: ListTile(
        leading: Icon(Icons.store, color: color),
        title:
            Text(businessName, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(category),
        trailing: ElevatedButton(
          onPressed: () {},
          child: Text('Ajukan kerja sama'),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (_selectedIndex != index)
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color.fromARGB(0, 255, 255, 255),
            ),
          ),
        if (_selectedIndex == index)
          Container(
            width: 50,
            height: 50,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Color(0xFF2C3E50)),
          ),
        Icon(
          icon,
          size: 32,
          color: _selectedIndex == index
              ? Colors.white
              : Color.fromRGBO(72, 76, 82, 100),
        ),
      ],
    );
  }
}
