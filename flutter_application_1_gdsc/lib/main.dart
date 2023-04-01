

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GDSC Timetable',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: MyHomePage(title: 'GDSC Timetable'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedGroup = 'Group 1'; // Default selected group
  Map<String, List<String>> timetable = {
    'Group 1': [      'Monday: 10:00 AM - 12:00 PM',      'Wednesday: 2:00 PM - 4:00 PM',      'Friday: 10:00 AM - 12:00 PM',    ],
    'Group 2': [      'Monday: 2:00 PM - 4:00 PM',      'Wednesday: 10:00 AM - 12:00 PM',      'Friday: 2:00 PM - 4:00 PM',    ],
    'Group 3': [      'Tuesday: 10:00 AM - 12:00 PM',      'Thursday: 2:00 PM - 4:00 PM',      'Saturday: 10:00 AM - 12:00 PM',    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DropdownButton<String>(
                value: selectedGroup,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedGroup = newValue!;
                  });
                },
                items: timetable.keys
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Text(
                'Timetable for $selectedGroup:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Column(
                children: timetable[selectedGroup]!
                    .map((String item) => Text(
                          item,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ))
                    .toList(),
              ),
              SizedBox(height: 20),
              Text(
                '© GDSC',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
