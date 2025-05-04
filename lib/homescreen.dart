import 'package:flutter/material.dart';
import 'package:skinsense1/articlescreen.dart';
import 'package:skinsense1/chatscreen.dart';
import 'package:skinsense1/profilescreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GeminiChatScreen()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ArticlesScreen()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8E1E7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'SkinSense',
            style: TextStyle(
              color: Colors.black,
              backgroundColor: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'Thanks for completing the survey!',
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 15, // Increased elevation for prominence
        shape: const CircularNotchedRectangle(),
        notchMargin: 10.0, // Adjusted for better fit
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavButton(Icons.home, 0, 'Home'),
            _buildNavButton(Icons.chat, 1, 'Chat'),
            const SizedBox(width: 60), // Adjusted space for FAB
            _buildNavButton(Icons.explore, 2, 'Explore'),
            _buildNavButton(Icons.person, 3, 'Profile'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Scan button pressed');
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.camera_enhance, color: Colors.black, size: 35), // Stylized camera icon
        elevation: 15, // Increased elevation for prominence
        tooltip: 'Scan',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildNavButton(IconData icon, int index, String tooltip) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Transform.scale(
        scale: isSelected ? 1.2 : 1.0, // Slightly enlarge when selected for prominence
        child: Material(
          elevation: 0, // Remove elevation to eliminate shadow
          borderRadius: BorderRadius.circular(12),
          color: Colors.transparent, // No background color change
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Tooltip(
              message: tooltip,
              child: Icon(
                icon,
                color: isSelected ? Colors.pink[100] : Colors.black, // Icon color changes to pink[50]
                size: 34, // Increased icon size slightly
              ),
            ),
          ),
        ),
      ),
    );
  }
}