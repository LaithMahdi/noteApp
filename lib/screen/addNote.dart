import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'dart:ui';

class addNote extends StatefulWidget {
  const addNote({super.key});

  @override
  State<addNote> createState() => _addNoteState();
}

class _addNoteState extends State<addNote> {
  TextEditingController title = new TextEditingController();
  TextEditingController paragraph = new TextEditingController();
  add() async {
    var url = "http://192.168.1.102/noteApp/addNotes.php";
    await http.post(Uri.parse(url), body: {
      "title": title.text,
      "paragraph": paragraph.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Form(
            child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: title,
                decoration: InputDecoration(
                  hintText: "Title",
                  contentPadding: EdgeInsets.all(5),
                  enabledBorder: InputBorder.none,
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
              TextFormField(
                controller: paragraph,
                minLines: 10,
                maxLines: 15,
                decoration: InputDecoration(
                  hintText: "Paragraph",
                  contentPadding: EdgeInsets.all(5),
                  enabledBorder: InputBorder.none,
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
              Container(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          add();
                        });
                        Navigator.of(context).pushReplacementNamed("home");
                      },
                      child: Text(
                        "Add Note",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ))),
            ],
          ),
        )),
      ),
    );
  }
}
