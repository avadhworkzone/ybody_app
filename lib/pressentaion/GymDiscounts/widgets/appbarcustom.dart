import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedOption;
  bool _dropdownOpen = false;
  String dropdownValue = 'Dog';
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          //<-- SEE HERE
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          //<-- SEE HERE
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
        filled: true,
        fillColor: Colors.greenAccent,
      ),
      dropdownColor: Colors.greenAccent,
      value: dropdownValue,
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['Dog', 'Cat', 'Tiger', 'Lion']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
            value: value,
            child: Container(
              color: Colors.greenAccent,
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.ac_unit),
                      Text(value),
                    ],
                  ),
                ],
              ),
            ));
      }).toList(),
    );
  }
}
