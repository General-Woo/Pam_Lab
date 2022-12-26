import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:age_calculator/age_calculator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lab 2",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = DateFormat('dd-MM-yyyy').format(DateTime.now());; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text("Laboratorul 2 Flutter"),
          backgroundColor: Colors.redAccent, //background color of app bar
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          height: MediaQuery.of(context).size.width / 3,
          child: Center(
            child: TextField(
              controller: dateInput,
              //editing controller of this TextField
              decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_today), //icon of text field
                  labelText: "Enter Date" //text of field
              ),
              readOnly: true,
              //set it true, so that user will not able to edit text
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2100));

                if ( pickedDate != null ) {
                  if (pickedDate.compareTo(DateTime.now()) < 0) {
                    print(pickedDate);
                    DateDuration birthday = AgeCalculator.age(pickedDate);
                    String formattedDate =
                    DateFormat('dd-MM-yyyy').format(pickedDate);
                    print(formattedDate); //formatted date output using intl package =>  2021-03-16
                    setState(() {
                      dateInput.text =
                          formattedDate;
                    });
                    var snackBar = SnackBar(content: Text('You Have: $birthday'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                  }else {
                    setState(() {
                      dateInput.text = "Check your data corectitude";
                    });
                  }
                }
              },
            ),
          ),
        )
    );
  }
}