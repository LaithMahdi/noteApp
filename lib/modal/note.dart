import 'package:flutter/material.dart';

class noteModal extends StatelessWidget {
  noteModal({this.title, this.description, this.date});
  final String? title;
  final String? description;
  final String? date;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.95,
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 5),
        decoration: BoxDecoration(
            color: Colors.green[100], borderRadius: BorderRadius.circular(15)),
        child: ListTile(
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              title!,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              date!,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            )
          ]),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(description!,
                    style: TextStyle(fontSize: 16, color: Colors.grey[900])),
                /*IconButton(
                  onPressed: () {
                    print("button pressed");
                  },
                  icon: Icon(Icons.delete),
                ),*/
              ],
            ),
          ),
          //trailing: Icon(Icons.delete),
        ));
  }
}
