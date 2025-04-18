import 'package:flutter/material.dart';

void main() {
  runApp(MoodApp());
}

class MoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood Tracker',
      home: MoodPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MoodPage extends StatefulWidget {
  @override
  _MoodPageState createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> {
  final List<Map<String, String>> moods = [
    {'emoji': '😊', 'text': 'Feeling happy!'},
    {'emoji': '😢', 'text': 'Feeling a bit down.'},
    {'emoji': '😡', 'text': 'Feeling angry!'},
    {'emoji': '😴', 'text': 'Feeling sleepy...'},
    {'emoji': '🤩', 'text': 'Feeling excited!'},
  ];

  int currentIndex = 0;

  void nextMood() {
    setState(() {
      currentIndex = (currentIndex + 1) % moods.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mood = moods[currentIndex];
    return Scaffold(
      appBar: AppBar(title: Text('Mood Tracker'), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(mood['emoji']!, style: TextStyle(fontSize: 60)),
              SizedBox(height: 16),
              Text(
                mood['text']!,
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              ElevatedButton(onPressed: nextMood, child: Text('Next Mood')),
            ],
          ),
        ),
      ),
    );
  }
}
