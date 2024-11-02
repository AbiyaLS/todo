import 'package:flutter/material.dart';
import 'package:todo/util/addtask_button.dart';
import 'package:todo/widgets/text_todotile.dart';
import 'package:todo/widgets/textfield_todotile.dart';

class newTodotile extends StatelessWidget {
  newTodotile({super.key});

  TextEditingController _timeController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _taskController = TextEditingController();
  TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 25,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            textSection(
              text: "Add New Tasks",
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text("What are you planing?"),
            ),
            CustomTextField(
              controller: _taskController,
              borderColor: Colors.white,
              fontSize: 30,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Divider(),
            ),
            SizedBox(height: 25),
            CustomTextField(
                controller: _noteController,
                borderColor: Colors.white,
                hintText: "Add Note",
                prefixIcons: Icon(
                  Icons.bookmark_border,
                  color: Colors.grey[500],
                )),
            SizedBox(
              height: 40,
            ),
            CustomTextField(
              hintText: "Time",
              borderColor: Colors.grey,
              controller: _timeController,
              onTap: () async {
                TimeOfDay? PickedTime = await showTimePicker(
                    context: context, initialTime: TimeOfDay.now());
                if (PickedTime != null) {
                  String formattedTime = PickedTime.format(context);
                  _timeController.text = formattedTime;
                }
              },
            ),
            SizedBox(
              height: 18,
            ),
            CustomTextField(
              hintText: "Date",
              borderColor: Colors.grey,
              controller: _dateController,
              onTap: () async {
                DateTime? PickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2101));
                if (PickedDate != null) {
                  String formattedDate =
                      "${PickedDate.day}/${PickedDate.month}/${PickedDate.year}";
                  _dateController.text = formattedDate;
                }
              },
            ),
            SizedBox(
              height: 100,
            ),
            AddtaskButton(
              text: "Add Task",
              onPressed: () {
                String taskName = _taskController.text;
                String taskNote = _noteController.text;
                String taskTime = _timeController.text;
                String taskDate = _dateController.text;
        
                // Pass data back to todoPage
                Navigator.pop(context, [
                  taskName,
                  taskNote,
                  taskTime,
                  taskDate,
                  false, // taskCompleted
                ]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
