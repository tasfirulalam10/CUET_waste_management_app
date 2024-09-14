// loading_page.dart
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Add any loading logic here (e.g., fetching data, checking authentication)
    // Once loading is complete, navigate to the login page
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add your logo image
            Image.asset(
              'images/cuetlogo.png', // Replace with your logo image path
              width: 100, // Adjust the width as needed
              height: 100, // Adjust the height as needed
            ),
            SizedBox(height: 5), // Add spacing between logo and text
            // Add your app name or title
            Image.asset(
              'images/name.png', // Replace with your logo image path
              width: 250, // Adjust the width as needed
              height: 200, // Adjust the height as needed
            ),
            SizedBox(height: 16), // Add spacing between text and loading indicator
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
