import 'package:flutter/material.dart';
import 'package:taxify_2_0/modal/app_modal.dart';
import 'package:taxify_2_0/modal/ride_request.dart';

class CreateRequestScreen extends StatefulWidget {
  const CreateRequestScreen({super.key, required this.appModel});
  final AppModel appModel;
  @override
  State<CreateRequestScreen> createState() => _CreateRequestScreenState();
}

class _CreateRequestScreenState extends State<CreateRequestScreen> {
  final _startingPointController = TextEditingController();
  final _destinationController = TextEditingController();
  DateTime? _selectedDate;
  int? seatAvailable = 1;
  @override
  void dispose() {
    _startingPointController.dispose();
    _destinationController.dispose();
    super.dispose();
  }

  void _presentDayPicker() async {
    final now = DateTime.now();
    final firstDate = now;
    final lastDate = DateTime(now.year, now.month + 1, now.day);
    ;
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  //   String id;
  // String creatorName;
  // String startingPoint;
  // String destination;
  // int seatsAvailable;
  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + keyboardSpace),
          //top 16 cuz used safe area true in modal sheet.
          child: Column(
            children: [
              TextField(
                //onChanged: _saveEnteredTitle, //d
                controller: _startingPointController,
                maxLength: 50,
                decoration: InputDecoration(
                  label: Text("From"),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                //onChanged: _saveEnteredTitle, //d
                controller: _destinationController,
                maxLength: 50,
                decoration: InputDecoration(
                  label: Text("To"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          _selectedDate == null
                              ? "No date selected"
                              : formatter.format(_selectedDate!),
                        ),
                        IconButton(
                          onPressed: _presentDayPicker,
                          icon: Icon(Icons.calendar_month),
                        ),
                      ],
                    ),
                  ),
                  // const SizedBox(
                  //   height: 50,
                  // ),
                  // Spacer(),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        DropdownButton<int>(
                          hint: Text(
                              'Select an option'), // Optional text to display as a hint
                          value: seatAvailable,
                          onChanged: (int? newValue) {
                            setState(() {
                              seatAvailable = newValue;
                            });
                          },
                          items: <int>[1, 2, 3, 4, 5, 6, 7, 8]
                              .map<DropdownMenuItem<int>>((int value) {
                            return DropdownMenuItem<int>(
                              value: value,
                              child: Text(value
                                  .toString()), // Convert the integer to a string
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); //CLose THe bottom modal manually
                    },
                    child: const Text("Cancel"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // _submitExpenseData();
                      //print(_enteredTitle); //e
                      // print(_titleController.text);
                      // print(_amountController.text);
                    },
                    child: const Text("Create Request"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
