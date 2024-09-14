import 'package:flutter/material.dart';

class ComplaintSubmissionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Submit Complaint'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Add location input fields (latitude and longitude)
          TextField(
            decoration: InputDecoration(labelText: 'Latitude'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Longitude'),
            keyboardType: TextInputType.number,
          ),
          // Add comment input field
          TextField(
            decoration: InputDecoration(labelText: 'Comment'),
            maxLines: 3,
          ),
          // Add a submit button
          ElevatedButton(
            onPressed: () {
              // Implement complaint submission logic
            },
            child: Text('Submit Complaint'),
          ),
        ],
      ),
    );
  }
}
