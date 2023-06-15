import 'package:flutter/material.dart';
import 'package:to_do__app/widget/counter.dart';
import 'package:to_do__app/widget/task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const To_Do_App(),
    );
  }
}

// ------------------------------------------------------------------------------------------
class tasks {
  String title;
  bool status;
  tasks({required this.title, required this.status});
}

List All_tasks = [
  tasks(title: "Welcome", status: false),
];
int tasks_completed() {
  int count = 0;
  All_tasks.forEach((element) {
    if (element.status == true) {
      count++;
    }
  });
  return count;
}

// ------------------------------------------------------------------------------------------
class To_Do_App extends StatefulWidget {
  const To_Do_App({super.key});

  @override
  State<To_Do_App> createState() => _To_Do_AppState();
}

class _To_Do_AppState extends State<To_Do_App> {
  // -----------------------------------------------------------------------------------------
  change_status(index) {
    setState(() {
      All_tasks[index].status = !All_tasks[index].status;
    });
  }

  delete_task(index) {
    setState(() {
      All_tasks.remove(All_tasks[index]);
    });
  }

  delete_all_tasks() {
    setState(() {
      All_tasks.removeRange(0, All_tasks.length);
    });
  }

  add_new_task() {
    setState(() {
      All_tasks.add(tasks(title: my_controller.text, status: false));
    });
  }

  data_bicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime.now());
  }

  final my_controller = TextEditingController();
  // -----------------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 53, 50, 50),
          centerTitle: true,
          title: Text(
            "To Do App",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  delete_all_tasks();
                },
                icon: Icon(
                  Icons.delete_forever,
                  color: Colors.red,
                  size: 35,
                ))
          ],
          leading: IconButton(
            onPressed: () {
              data_bicker();
            },
            icon: Icon(
              Icons.calendar_month_outlined,
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/img/background.jpg"),
                fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Counter(),
                Container(
                  height: 618,
                  child: ListView.builder(
                      itemCount: All_tasks.length,
                      itemBuilder: (BuildContext context, int index) {
                        return to_do_card(
                          title: All_tasks[index].title,
                          status: All_tasks[index].status,
                          i: index,
                          change_status: change_status,
                          delete_task: delete_task,
                        );
                      }),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      height: 170,
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          TextField(
                            controller: my_controller,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: "Add New Task",
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                add_new_task();
                              },
                              child: Text(
                                "ADD",
                                style: TextStyle(fontSize: 22),
                              ))
                        ],
                      ),
                    ),
                  );
                });
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
