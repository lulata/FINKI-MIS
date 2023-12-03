import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class MyHomePage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> subjects = [
    "Мобилни и информациски системи",
    "Веројатност и статистика",
    "Бази на податоци",
    "Шаблони за дизајн на кориснички интерфејси",
    "Тимски проект",
  ];
  String studentIndex = "201202";

  TextEditingController subjectController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(studentIndex),
      ),
      backgroundColor: Colors.blue[50],
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: subjects.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(subjects[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        subjects.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                _showAddSubjectDialog();
              },
              child: const Text("Додади предмет"),
            ),
          ),
        ],
      ),
    );
  }

  _showAddSubjectDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Додади предмет"),
          content: TextField(
            controller: subjectController,
            decoration: const InputDecoration(labelText: "Име на предмет"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Откажи"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  subjects.add(subjectController.text);
                  subjectController.text = "";
                });
                Navigator.pop(context);
              },
              child: const Text("Додади"),
            ),
          ],
        );
      },
    );
  }
}
