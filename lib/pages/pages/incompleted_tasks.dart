import 'package:flutter/cupertino.dart';
import 'package:todoapp/data/repository.dart';
import 'package:todoapp/model/task.dart';
import 'package:todoapp/pages/widgets/task_widget.dart';

class IncopmletedTasks extends StatelessWidget{
  List<Task> taskes;
  Function deleteFunction;
  Function checkedFunction;
  IncopmletedTasks(this.taskes,this.deleteFunction,this.checkedFunction);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
          itemCount:taskes.where((element) => !element.isCompleted).length,
          itemBuilder: (ctx,indx){
            return TaskWidget(taskes.where((element) => !element.isCompleted).toList()[indx],deleteFunction,checkedFunction);
          }),
    );
  }



}
