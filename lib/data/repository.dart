import 'package:flutter/material.dart';
import 'package:todoapp/model/task.dart';
class Repository{
  static List<Task> taskes=[
    Task(
        descripstion: "ab dc eg lls kjdjn lkl ljjf",
        title: "dart",
        id: "qqqqq",
        isCompleted: true),
    Task(
        descripstion: "ab lkjgh k jk hjn lkl ljjf",
        title: "flutter",
        id: "cccccc",
        isCompleted: true),
    Task(
      descripstion: "ab dc dfhg kjdfh jk jn lkl ljjf",
      title: "java",
      id: "aaaaaa",
      isCompleted: false,
    ),
    Task(
        descripstion: "avd fofm  f jn lkl ljjf",
        title: "python",
        id: "qzzzzqq",
        isCompleted: false),
    Task(
        descripstion: "ab dc eg lls kjdjn lkl ljjf",
        title: "react",
        id: "pppppp",
        isCompleted: true),
  ];
}
