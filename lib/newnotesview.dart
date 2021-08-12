import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'note.dart';

class NewNotesView extends StatefulWidget {

  @override
  _NewNotesViewState createState() => _NewNotesViewState();
}

class _NewNotesViewState extends State<NewNotesView> {
  // List<Note> notes = [
  //   Note("First note", "First content"),
  //   Note("2 note", "2 content"),
  //   Note("3 note", "3 content"),
  //   Note("4 note", "4 content"),
  //   Note("5 note", "5 content"),
  //   Note("6 note", "6 content"),
  //   Note("7 note", "7 content"),
  // ];
  late Future<List<Note>> notes;

  Future<List<Note>> fetchNotes() async {
    final response = await http.get(Uri.parse('https://spneshaei.com/mil/getNotes.php'));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      List<Note> notes = [];
      for (var jsonObject in json) {
        notes.add(Note(jsonObject["title"], jsonObject["text"]));
      }
      return notes;
    } else {
      throw Exception('Failed connection');
    }
  }

  @override
  void initState() {
    super.initState();
    notes = fetchNotes();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Notes"),
        ),
        body: FutureBuilder<List<Note>>(
          future: notes,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var notes = snapshot.data!;
              return ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.add),
                    title: Text(notes[index].title),
                    onTap: () {
                      print(notes[index].text);
                    },
                  );
                  // return Text(notes[index].title);
                },
              );
            } else if (snapshot.hasError) {
              return Text("Error");
            }

            return CircularProgressIndicator();
          },
        )


    );
  }
}
