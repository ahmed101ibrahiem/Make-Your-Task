import 'package:flutter/material.dart';
import 'package:missin_app/widgets/tasks_widget.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({Key? key}) : super(key: key);
  List<String> taskCategoryList = [
    'Business',
    'Programing',
    'InformationTechnology',
    'Human Resources',
    'Marketing',
    'Design',
    'Accounting'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            );
          },
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Tasks',
          style: TextStyle(color: Colors.pink),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          'Task Category',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.pink,
                          ),
                        ),
                        content: Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: ListView.builder(
                            shrinkWrap: true,
                              itemCount: taskCategoryList.length,
                              itemBuilder: (context, int index) {
                                return Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle_rounded,
                                      color: Colors.red[200],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text(
                                        taskCategoryList[index],
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Color(0xFF00325A),
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.canPop(context)
                                    ? Navigator.pop(context)
                                    : null;
                              },
                              child: Text('Close')),
                          TextButton(
                              onPressed: () {}, child: Text('Cancel filter'))
                        ],
                      );
                    });
              },
              icon: Icon(
                Icons.filter_list_outlined,
                color: Colors.black,
              ))
        ],
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, int index) {
            return TaskWidget();
          }),
    );
  }
}
