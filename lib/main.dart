import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Show Search Widget Demo',
      theme: ThemeData( primarySwatch: Colors.blue,
      ),
      home: const ShowSearchScreen(),
    );
  }
}

class ShowSearchScreen extends StatefulWidget {
  const ShowSearchScreen({Key? key}) : super(key: key);

  @override
  _ShowSearchScreenState createState() => _ShowSearchScreenState();
}

class _ShowSearchScreenState extends State<ShowSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Show Search Widget Demo"),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate(),);
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = ["Java", "C", "C++", "Dart", "Python", "JavaScript", "C/CPP", "PHP", "Swift", "C# (C- Sharp)", "Ruby", "Objective-C", "SQL", "Go", "Kotlin", "R", "Matlab", "Groovy", "Assembly language", "Visual Basic", "Perl", "Pascal", "Scala", "Shell"];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
        itemBuilder: (context, index) {
        var results = matchQuery[index];
        return ListTile(
          title: Text(results),
        );
        },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var results = matchQuery[index];
        return ListTile(
          title: Text(results),
        );
      },
    );
  }
}
