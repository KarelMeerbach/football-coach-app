import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

import '../models/users_model.dart';
import '../providers/auth_providers.dart';
import '../widgets/default_appbar.dart'; // For UUID generation (optional)


class RegisterScreen extends ConsumerWidget {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.read(authServiceProvider);
    final supabase = Supabase.instance.client;

    return Scaffold(
      appBar: DefaultAppbar(title: "Register"),//appBar: AppBar(title: Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  final passwordHash = _hashPassword(_passwordController.text.trim());


                  // Register user with Firebase
                  final userCredential = await authService.register(
                    _emailController.text.trim(),
                    _passwordController.text.trim(),
                  );



                  // Construct the AppUser instance
                  final newUser = AppUser(
                    id: userCredential.user!.uid,
                    email: _emailController.text.trim(),
                    firstName: _firstNameController.text.trim(),
                    lastName: _lastNameController.text.trim(),
                    passwordHash: passwordHash,
                    roleId: 1, // Default role ID (adjust as needed)
                  );

                  // Add user to Supabase
                  if(newUser.id == "ERROR"){
                    return;
                  }
                  final response = await supabase
                      .from('users')
                      .insert(newUser.toMap());

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Registration successful!')),
                  );
                  Navigator.pop(context); // Go back to login screen
                } catch (err) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Registration failed: $err')),
                  );
                }
              },
              child: Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
// Function to hash the password using SHA-256
String _hashPassword(String password) {
  final bytes = utf8.encode(password); // Convert password to bytes
  final digest = sha256.convert(bytes); // SHA-256 hash
  return digest.toString(); // Return hashed password as a string
}

Future<bool> fetchResults() async {
  return Future.delayed(const Duration(milliseconds: 3000), () {
    return true;
  });
}
