import 'package:flutter/material.dart';

class to_do_card extends StatelessWidget {
  String title;
  bool status;
  int i;
  Function change_status;
  Function delete_task;

  to_do_card(
      {required this.title,
      required this.status,
      required this.i,
      required this.change_status,
      required this.delete_task});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        change_status(i);
      },
      child: Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color.fromARGB(129, 66, 62, 62),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 25,
                color: status ? Colors.black : Colors.white,
                decoration: status ? TextDecoration.lineThrough : null,
              ),
            ),
            Row(
              children: [
                Icon(
                  status ? Icons.check : Icons.close,
                  color: status ? Colors.green : Colors.red,
                  size: 35,
                ),
                IconButton(
                    onPressed: () {
                      delete_task(i);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 30,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
