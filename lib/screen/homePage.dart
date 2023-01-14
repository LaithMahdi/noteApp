import 'dart:async';
import 'package:flutter/material.dart';
import 'package:untitled1/modal/note.dart';
import 'package:untitled1/modal/searchBar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:untitled1/screen/editNote.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List list = [];
  Future getNotes() async {
    var url = "http://192.168.1.102/noteApp/read.php";
    var request = await http.get(Uri.parse(url));
    var answer = jsonDecode(request.body);
    setState(() {
      list.addAll(answer);
    });
  }

  @override
  void initState() {
    Timer(Duration(seconds: 1), () => getNotes());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Note App",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed("add");
            },
            child: Icon(Icons.add)),
        body: list == null || list.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.green[400],
                ),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      print("success");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => editNote(
                                    list: list[index],
                                  ))));
                    },
                    child: Dismissible(
                      key: Key(list[index].toString()),
                      onDismissed: (direction) async {
                        var url = "http://192.168.1.102/noteApp/delete.php";
                        await http.post(Uri.parse(url), body: {
                          'id': list[index]['id'],
                        });
                      },
                      background: Container(color: Colors.green[400]),
                      //margin: EdgeInsets.symmetric(horizontal: 10),
                      child: noteModal(
                        title: list[index]["title"],
                        description: list[index]["paragraph"],
                        date: list[index]["date"],
                      ),
                    ),
                  );
                },
                itemCount: list.length,
              ));
  }
}
