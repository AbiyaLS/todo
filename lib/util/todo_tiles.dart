import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class todoTile extends StatelessWidget {
  final String taskName;
  final String taskNote;
  final dynamic taskTime;
  final dynamic taskDate;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext) ?deleteFunction;

  todoTile(
      {super.key,
      required this.taskName,
      required this.taskNote,
      required this.taskTime,
      required this.taskDate,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Slidable(
        endActionPane:  ActionPane(motion:StretchMotion(), children: [
          SlidableAction(onPressed: deleteFunction,
          icon: Icons.delete_outline_rounded,)
        ]),
        child: Container(
          height: screenHeight * 0.2,
          decoration: BoxDecoration(
              color: taskCompleted ? Color(0xF0E4B1F0) : Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    offset: Offset(0, 4),
                    blurRadius: 5,
                    spreadRadius: 1)
              ]),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                  shape: CircleBorder(),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      taskName,
                      style: TextStyle(
                          decoration: taskCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          fontSize: 18),
                    ),
                    Text(
                      taskNote,
                      style: TextStyle(
                          color: Colors.grey[600],
                          decoration: taskCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.65),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // Time text
                          Text(
                            taskTime,
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(height: 5),
                          // Date text
                          Text(
                            taskDate,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
