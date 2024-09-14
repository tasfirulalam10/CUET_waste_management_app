import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'login_page.dart';

class Complaint {
  final String location;
  final String description;

  Complaint({required this.location, required this.description});
}

class Cleaner {
  final String? name;
  final String? email;
  String? assignedTasks;

  Cleaner({
    required this.name,
    required this.email,
    required this.assignedTasks,
  });
}

class AdminComplaintsPage extends StatefulWidget {
  @override
  _AdminProfilePageState createState() => _AdminProfilePageState();
}

class _AdminProfilePageState extends State<AdminComplaintsPage> {
  List<Complaint> complaints = [];
  List<Cleaner> cleaners = [];
  String? selectedCleanerName = '';

  @override
  void initState() {
    super.initState();
    // Fetch complaints and cleaners data when the page is initialized
    fetchComplaints();
    fetchCleaners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Perform logout actions, such as navigating back to the login page
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              ); // Replace this with your actual logout logic
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Complaints:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              // Display complaints if available, otherwise show a message
              complaints.isNotEmpty
                  ? Column(
                children: complaints.map((complaint) {
                  return ListTile(
                    title: Text('Location: ${complaint.location}'),
                    subtitle:
                    Text('Description: ${complaint.description}'),
                  );
                }).toList(),
              )
                  : Text('No complaints available.'),
              SizedBox(height: 20),
              Text(
                'Cleaners List:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              // Display cleaners if available, otherwise show a message
              cleaners.isNotEmpty
                  ? Column(
                children: cleaners.map((cleaner) {
                  return ListTile(
                    title: Text('Name: ${cleaner.name}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email: ${cleaner.email}'),
                        TextFormField(
                          initialValue: cleaner.assignedTasks,
                          onChanged: (newValue) {
                            // Update assigned tasks for the cleaner
                            cleaner.assignedTasks = newValue;
                          },
                          decoration: InputDecoration(
                            labelText: 'Assigned Tasks',
                          ),
                        ),
                      ],
                    ),
                    // Trailing icon for deleting cleaner (removed)
                  );
                }).toList(),
              )
                  : Text('No cleaners available.'),
            ],
          ),
        ),
      ),
    );
  }

  // Fetch complaints data from the server
  Future<void> fetchComplaints() async {
    final response =
    await http.get(Uri.parse('http://192.168.0.110:3000/complaints'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        complaints = data
            .map((complaint) => Complaint(
          location: complaint['location'],
          description: complaint['description'],
        ))
            .toList();
      });
    } else {
      throw Exception('Failed to load complaints');
    }
  }

  // Fetch cleaners data from the server
  Future<void> fetchCleaners() async {
    final response =
    await http.get(Uri.parse('http://192.168.0.110:3000/users/register'));

    if (response.statusCode == 200) {

      final List<dynamic> data = json.decode(response.body);
      setState(() {
        cleaners = data
            .map((cleaner) => Cleaner(
          name: cleaner['username'],
          email: cleaner['email'],
          assignedTasks: cleaner['assignedTasks'],
        ))
            .toList();
      });
    } else {
      throw Exception('Failed to load cleaners');
    }
  }

  // Fetch and display the list of cleaners with the role 'cleaner'
  Future<void> fetchCleanersWithRole() async {
    final response =
    await http.get(Uri.parse('http://192.168.0.110:3000/users/register'));

    if (response.statusCode == 200) {

      print('Registration Response Code: ${response.statusCode}');
      print('Registration Response Body: ${response.body}');

      final List<dynamic> data = json.decode(response.body);
      setState(() {
        cleaners = data
            .map((cleaner) => Cleaner(
          name: cleaner['name'],
          email: cleaner['email'],
          assignedTasks: cleaner['assignedTasks'],
        ))
            .toList();
      });
    } else {
      throw Exception('Failed to fetch cleaners with role');
    }
  }
}
