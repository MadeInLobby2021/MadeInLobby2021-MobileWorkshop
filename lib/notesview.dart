import 'package:flutter/material.dart';

import 'note.dart';

class NotesView extends StatelessWidget {

  List<Note> notes = [
    Note("First note", "First content"),
    Note("2 note", "2 content"),
    Note("3 note", "3 content"),
    Note("4 note", "4 content"),
    Note("5 note", "5 content"),
    Note("6 note", "6 content"),
    Note("7 note", "7 content"),
  ];

  void addTestNote() {
    notes.add(Note("Test title", "Test content"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        actions: [
          IconButton(
              onPressed: addTestNote,
              icon: Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
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
      )
    );
  }
}
