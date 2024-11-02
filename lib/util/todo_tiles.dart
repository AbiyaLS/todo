import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final String taskNote;
  final dynamic taskTime;
  final dynamic taskDate;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  TodoTile({
    super.key,
    required this.taskName,
    required this.taskNote,
    required this.taskTime,
    required this.taskDate,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.endToStart,
        background: Container(
          alignment: Alignment.centerRight,
          // color: Colors.red,
          padding: EdgeInsets.only(right: 20),
          child: Center(
            child: Icon(
              Icons.delete_outline_rounded,
              // color: Colors.white,
            ),
          ),
        ),
        onDismissed: (direction) {
          if (deleteFunction != null) {
            deleteFunction!(context);
          }
        },
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
                spreadRadius: 1,
              ),
            ],
          ),
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
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        taskName,
                        style: TextStyle(
                          decoration: taskCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        taskNote,
                        style: TextStyle(
                          color: Colors.grey[600],
                          decoration: taskCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),),],
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          taskTime,
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 5),
                        Text(
                          taskDate,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
