import 'package:flutter/material.dart';
import 'package:to_do__app/main.dart';

class Counter extends StatefulWidget {
  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Text(
        "${tasks_completed()}/${All_tasks.length}",
        style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: tasks_completed() == All_tasks.length
                ? Colors.green
                : Colors.white),
      ),
    );
  }
}
