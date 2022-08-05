import 'package:flutter/material.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({Key? key}) : super(key: key);

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: ListTile(
        onTap: () {},
        onLongPress: () {
          showDialog(context: context, builder: (context){
            return AlertDialog(
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.delete,
                        color: Colors.red
                    ),
                    Text('Delete',style: TextStyle(color: Colors.red),)
                  ],
                )
              ],
            );
          });
        },
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: BoxDecoration(
            border: Border(right: BorderSide(width: 1.0)),
          ),
          child: CircleAvatar(
            backgroundColor: Colors.teal,
            radius: 20,
            child: Image.network('https://e7.pngegg.com/pngimages/983/597/png-clipart-hanoi-true-miscellaneous-angle.png',fit: BoxFit.cover,),
          ),
        ),
        title: Text(
          'Title',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.linear_scale,
              color: Colors.pink,
            ),
            Text(
              'subtitle/description',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16
              ),
            ),
          ],
        ),
        trailing: Icon(Icons.keyboard_arrow_right,size: 30,color: Colors.pink[800],),
      ),
    );
  }
}
