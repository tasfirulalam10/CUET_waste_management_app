import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'complaint_page.dart';
import 'registration_page.dart';
import 'admin_complaints_page.dart';
import 'cleaner_tasks_page.dart';
class LoginPage extends StatelessWidget {
  // Controllers for text fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CUET Waste-management'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 30,),
              Image.asset(
                'images/cuetlogo.png',
                width: 100,
                height: 100,
              ),
              SizedBox(height: 10,),
              // Email input field
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              // Password input field
              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              // Login button
              ElevatedButton(
                onPressed: () {
                  // Calling _performLogin with email and password values
                  _performLogin(context, emailController.text, passwordController.text);
                },
                child: Text('Login'),
              ),
              // Registration option
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistrationPage()),
                  );
                },
                child: Text('Not registered yet? Register here'),
              ),
              SizedBox(height: 30,),
              // Add complaint button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ComplaintPage()),
                  );
                },
                child: Text('Add Complaint'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _performLogin(BuildContext context, String username, String password) async {
    final response = await http.post(
      Uri.parse('http://192.168.0.110:3000/users/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> userData = json.decode(response.body)['user'];
      final String userRole = userData['role'];

      if (userRole == 'cleaner') {
        print('Navigating to cleaner tasks page');
        Navigator.pushReplacementNamed(context, '/cleaner_tasks');
      } else if (userRole == 'admin') {
        print('Navigating to admin complaints page');
        Navigator.pushReplacementNamed(context, '/admin_complaints');
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid username or password'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
