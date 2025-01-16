import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens/auth/login_screen.dart';
import '../widgets/theme_toggle_button.dart';

class DefaultAppbar extends StatelessWidget implements PreferredSizeWidget {
  DefaultAppbar({super.key, required this.title});
  String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(title!),
        actions: [
          ThemeToggleButton(),
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              try {
                // Log out from Firebase
                await FirebaseAuth.instance.signOut();

                // After sign-out, navigate to the login screen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error logging out: $e')),
                );
              }
            },
          ),// 🌗 Theme toggle button
        ],
      );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}