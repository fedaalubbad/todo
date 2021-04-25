import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/model/task.dart';

class TaskWidget extends StatelessWidget{
  Task taske;
  Function deleteFunction;
  Function checkedFunction;
  TaskWidget(this.taske,this.deleteFunction,this.checkedFunction);

  @override
  Widget build(BuildContext context) {
 return Container(
   decoration: BoxDecoration(color:taske.isCompleted?Colors.blue:Colors.redAccent,borderRadius:BorderRadius.circular(15),),
   padding: EdgeInsets.all(5),
   margin: EdgeInsets.symmetric(vertical: 5),
   child: ListTile(title: Text(taske.title ,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
   subtitle: Text(taske.descripstion,style: TextStyle(color: Colors.white,fontSize: 18,)),
   leading: IconButton(icon: Icon(Icons.delete,color: Colors.white,),onPressed: (){deleteFunction(taske);},),
   trailing: Checkbox(checkColor:Colors.amber,value: taske.isCompleted,onChanged:(val){
       checkedFunction(taske);
   },
   ),
   ),
 );
  }



}