import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'task_model.dart';

class Task {
  final String title;
  final String description;

  Task({required this.title, required this.description});
}

class Cleaner {
  final String name;
  final String email;
  String assignedPlace;
  String avatarUrl;

  Cleaner({
    required this.name,
    required this.email,
    required this.assignedPlace,
    required this.avatarUrl,
  });
}

class CleanerTasksPage extends StatelessWidget {
  final Cleaner cleaner;

  CleanerTasksPage({required this.cleaner});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cleaner Tasks'),
      ),
      body: FutureBuilder<List<Task>>(
        future: fetchCleanerTasks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError || snapshot.data == null) {
            return Text('Error: ${snapshot.error ?? "Unable to fetch data"}');
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].title ?? 'No Title'),
                  subtitle: Text(snapshot.data![index].description ?? 'No Description'),
                );
              },
            );
          }
        },
      ),
    );
  }

  // Implement a function to fetch cleaner tasks from the backend
  Future<List<Task>> fetchCleanerTasks() async {
    final response = await http.get(Uri.parse('http://198.168.0.110:3000//tasks/cleaner'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((task) => Task(title: task['title'], description: task['description'])).toList();
    } else {
      throw Exception('Failed to load cleaner tasks');
    }
  }
}
