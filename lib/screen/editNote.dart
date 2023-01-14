import 'dart:async';
import 'package:flutter/material.dart';
import 'package:untitled1/modal/note.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class editNote extends StatefulWidget {
  final list;

  editNote({Key? key, this.list}) : super(key: key);

  @override
  State<editNote> createState() => _editNoteState();
}

class _editNoteState extends State<editNote> {
  TextEditingController title = TextEditingController();
  TextEditingController paragraph = TextEditingController();

  Future updateNotes() async {
    var url = "http://192.168.1.102/noteApp/update.php";
    await http.post(Uri.parse(url), body: {
      "id": widget.list['id'].toString(),
      "title": title.text,
      "paragraph": paragraph.text,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    title.text = widget.list['title'];
    paragraph.text = widget.list['paragraph'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Note"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        //padding: EdgeInsets.symmetric(vertical: 25, horizontal: 5),
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
                        updateNotes();
                        Navigator.of(context).restorablePushNamed("home");
                      },
                      child: Text(
                        "Save Note",
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
