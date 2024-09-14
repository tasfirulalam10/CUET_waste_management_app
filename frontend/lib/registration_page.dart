import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'registration_successful.dart';

class RegistrationPage extends StatelessWidget {
  // Declare controllers for text fields
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController roleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'images/cuetlogo.png', // Replace with your logo image path
                width: 100, // Adjust the width as needed
                height: 100, // Adjust the height as needed
              ),
              SizedBox(height: 10,),
              // Registration input fields
              TextField(
                controller: usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              TextField(
                controller: roleController,
                decoration: InputDecoration(labelText: 'Role'),
              ),

              // Register button
              ElevatedButton(
                onPressed: () {
                  // Call function to send registration data to the server
                  _registerUser(context);
                  Navigator.pushReplacementNamed(context, '/registrationSuccess');
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _registerUser(BuildContext context) async {
    // Get user input
    String username = usernameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String role = roleController.text;

    // Validate input (you may add more validation)
    if (username.isEmpty || email.isEmpty || password.isEmpty || role.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all fields'),
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    // Send registration data to the server
    final response = await http.post(
      Uri.parse('http://192.168.0.110:3000/users/register'), // Replace with your server URL
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'email': email,
        'password': password,
        'role': role,
      }),
    );
    print('Registration Response Code: ${response.statusCode}');
    print('Registration Response Body: ${response.body}');

    if (response.statusCode == 200) {
      // registration_page.dart
      Navigator.pushReplacementNamed(context, '/registrationSuccess');

    } else {
      // Registration failed, show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registration failed. Please try again.'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
