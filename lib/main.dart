import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/data/repository.dart';
import 'package:todoapp/pages/pages/all_tasks.dart';
import 'package:todoapp/pages/pages/completed_tasks.dart';
import 'package:todoapp/pages/pages/incompleted_tasks.dart';

import 'model/task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'To Do List'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

PageController pageController=PageController();
int currentIndex=0;
deleteTask(Task task){
  Repository.taskes.remove(task);
  setState(() {

  });
}
checkTask(Task task){
 task.isCompleted?task.isCompleted=false:task.isCompleted=true;
 setState(() {

 });
}
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(currentIndex==0?widget.title:currentIndex==1?'Completed tasks':'Incompleted tasks'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(icon: Icon(Icons.list),
              onPressed:(){ currentIndex=0;
              setState(() {

              });
              pageController.jumpToPage(currentIndex);},),

            IconButton(icon: Icon(Icons.check),
              onPressed:(){ currentIndex=1;
              setState(() {

              });
              pageController.jumpToPage(currentIndex);},),

            IconButton(icon: Icon(Icons.close),
              onPressed:(){currentIndex=2;
              setState(() {

              });
              pageController.jumpToPage(currentIndex);},)
          ],
        ),
      ),
      body: PageView(
        controller: pageController,
        children: [
          AllTaskes(Repository.taskes,deleteTask,checkTask),
          CompletedTasks(Repository.taskes,deleteTask,checkTask),
          IncopmletedTasks(Repository.taskes,deleteTask,checkTask),
        ],

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>buildDialog(),
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
addNewTask(Task task){
  Repository.taskes.add(task);
  Navigator.of(context).pop();
  // setState(() {
  //
  // });
}
String title;
String desc;
bool value=false;
check(val){
  value=val;

}
   buildDialog(){
    var ad=AlertDialog(
    title: Text('Enter new task'),
    content:Container(
    child: Form(
    key: _formKey,
    child: SingleChildScrollView(
        child:Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(decoration: InputDecoration(labelText:'enter task title'),
              validator: (val){
                if(val.isEmpty){
                  return 'title is empty';
                } return null;
              },
              onSaved:(val){
                title=val;
                print(title);
              },
            ),
            TextFormField(decoration: InputDecoration(labelText:'enter task description'),
              validator: (val){
              if(val.isEmpty){
                return 'description is empty';
              } return null;
            },
              onSaved:(val){
                desc=val;
                print(desc);
              },
            ),
            SizedBox(height: 8,),
             // CheckboxListTile(
             //   title: Text('completed!'),
             //  value:value,
             //  checkColor:Colors.pinkAccent,
             //  onChanged:(val){
             //      check(val);
             //      setState(() {
             //      });
             //  },),
            SizedBox(height: 8,),
            RaisedButton(
              child: Text('Add'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 8),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).primaryTextTheme.button.color,
              onPressed: _submit,
            ),
          ],
        ) ,),
  ),
    ),
    );
      showDialog(context: context,child: ad,barrierColor: Colors.blueAccent.withOpacity(0.7),
                 barrierDismissible: true);
  }
void _submit(){
  setState(() {
    if(!_formKey.currentState.validate()){
      return ;
    }
    _formKey.currentState.save();
    addNewTask(Task(title: title,descripstion: desc,isCompleted: value));

  });

}
final _formKey = GlobalKey<FormState>();

}
