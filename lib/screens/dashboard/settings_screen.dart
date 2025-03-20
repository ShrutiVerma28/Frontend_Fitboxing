import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitboxing_app/providers/user_provider.dart';
import 'package:fitboxing_app/screens/auth/login_screen.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF151718),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Settings", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          children: [
            _buildSettingsItem(context, "Personal Information", Icons.person, () {
              // Navigate to Personal Information Screen
            }),
            _buildSettingsItem(context, "Password", Icons.lock, () {
              // Navigate to Password Change Screen
            }),
            _buildSettingsItem(context, "Language", Icons.language, () {
              // Navigate to Language Selection Screen
            }),
            _buildSettingsItem(context, "Payment", Icons.payment, () {
              // Navigate to Payment Screen
            }),
            _buildSettingsItem(context, "Contact Us", Icons.mail, () {
              // Navigate to Contact Support Screen
            }),
            _buildSettingsItem(context, "Log out", Icons.exit_to_app, () {
              _confirmLogout(context);
            }), // Logout looks like other items
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItem(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.grey.shade900, // Same color as other items
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Text(title, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            Spacer(),
            Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18),
          ],
        ),
      ),
    );
  }

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Text("Confirm Logout", style: TextStyle(color: Colors.white)),
          content: Text("Are you sure you want to log out?", style: TextStyle(color: Colors.grey)),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel", style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () {
                Provider.of<UserProvider>(context, listen: false).logout();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                      (route) => false,
                );
              },
              child: Text("Logout", style: TextStyle(color: Colors.redAccent)),
            ),
          ],
        );
      },
    );
  }
}
