import 'package:flutter/material.dart';
import 'login_page.dart';
import 'registration_page.dart';
import 'cleaner_tasks_page.dart';
import 'complaint_submission_page.dart';
import 'admin_complaints_page.dart';
import 'package:wastefrontend/admin_complaints_page.dart';
import 'package:wastefrontend/cleaner_tasks_page.dart';
import 'homePage.dart';
import 'registration_successful.dart';
//import 'package:flutter_dotenv/flutter_dotenv.dart';

void main()  {
  //await dotenv.load();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Waste Management App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(), // Set the initial page here
      routes: {
        '/home': (context)=> HomePage(),
       // '/cleanerTasks': (context) => CleanerTasksPage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegistrationPage(),
        '/registrationSuccess': (context) => RegistrationSuccessPage(),
        //'/cleaner_tasks': (context) => CleanerTasksPage(),
        '/complaint_submission': (context) => ComplaintSubmissionPage(),
        '/admin_complaints': (context) => AdminComplaintsPage(),
      },
    );
  }
}
