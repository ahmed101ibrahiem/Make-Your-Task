
import 'package:flutter/material.dart';
import 'package:missin_app/constant/constant.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        DrawerHeader(
          child: Column(
            children: [
              Flexible(
                child: Image.network(
                    'https://content.techgig.com/thumb/msid-80350905,width-1200,height-900,resizemode-4/80350905.jpg'),
              ),
              SizedBox(
                height: 16.0,
              ),
              Flexible(
                  child: Text(
                'Work OS Arabic',
                style: TextStyle(
                    color: Constant.darkblue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic),
              ))
            ],
          ),
          decoration: BoxDecoration(color: Colors.cyan),
        ),
        SizedBox(height: 30.0,),

        _listTiles(label: 'All Tasks',iconData: Icons.task,func: (){} ),
        _listTiles(label: 'My account',iconData: Icons.settings_outlined,func: (){}),
        _listTiles(label: 'Registered work',iconData: Icons.workspaces_outlined,func: (){}),
        _listTiles(label: 'Add task',iconData: Icons.add_task_outlined,func: (){}),
        Divider(thickness: 1,),
        _listTiles(label: 'Logout',iconData: Icons.logout_outlined,func: (){
          showDialog(context: context, builder: (context){
           return AlertDialog(
              title: Row(children: [
                Icon(Icons.no_sim,color: Colors.cyan,),
                SizedBox(width: 10,),
                Text('Sign out',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,

                ),),
              ],),
             content: Text('Do tou wanna Sign out?',style: TextStyle(
               color: Constant.darkblue,
               fontWeight: FontWeight.bold,
             ),),
             actions: [
               TextButton(onPressed: (){
                 Navigator.canPop(context)?Navigator.pop(context):null;
               }, child: Text('cancel',style: TextStyle(
                 color: Colors.cyan
               ),)),
               TextButton(onPressed: (){}, child: Text('ok',style: TextStyle(
                 color: Colors.red
               ),))
             ],
            );
          });
        }),

      ],
    ));
  }
  Widget _listTiles({required String label,required IconData iconData,required Function func}){
    return ListTile(
      onTap:()=> func(),
      leading: Icon(
        iconData
       ,
        color: Constant.darkblue,
      ),
      title: Text(
        label,
        style: TextStyle(
            color: Constant.darkblue,
            fontSize: 20,
            fontStyle: FontStyle.italic),
      ),
    );
  }
}
