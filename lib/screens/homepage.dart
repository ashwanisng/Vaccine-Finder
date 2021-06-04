import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vaccine_finder/screens/find_slots.dart';

class DataFeild extends StatefulWidget {
  @override
  _DataFeildState createState() => _DataFeildState();
}

class _DataFeildState extends State<DataFeild> {
  // TextEditingController _controller = TextEditingController();
  TextEditingController pincodeController = TextEditingController();

  String selectedDate = "";
  bool datePicked = false;

  List slots = [];

  selectDate(BuildContext context) async {}

  getData() async {
    await http
        .get(Uri.parse(
            "https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=" +
                pincodeController.text +
                "&date=" +
                selectedDate))
        .then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        slots = result['sessions'];
        print(slots);
      });
    });

    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return FindSlot(slots);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Image.asset('assets/images/doctor.jpg')),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: pincodeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Pincode',
                    hintText: 'Pincode'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff676FFE).withOpacity(0.7),
                      Color(0xff676FFE),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: MaterialButton(
                  elevation: 4,
                  onPressed: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(), // Refer step 1
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2025),
                    );
                    if (picked != null)
                      setState(
                        () {
                          String formattedDate =
                              DateFormat('dd-MM-yyyy').format(picked);
                          selectedDate = formattedDate;
                          datePicked = true;
                          print(selectedDate);
                        },
                      );
                  },
                  child: Text(datePicked == false ? 'Pick Date' : selectedDate),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff676FFE).withOpacity(0.7),
                      Color(0xff676FFE),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: MaterialButton(
                  elevation: 4,
                  onPressed: () {
                    getData();
                  },
                  child: Text('Find Slot'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
