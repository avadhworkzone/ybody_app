import 'package:flutter/material.dart';

class LanguageButtons extends StatefulWidget {
  const LanguageButtons({Key? key}) : super(key: key);

  @override
  _LanguageButtonsState createState() => _LanguageButtonsState();
}

class _LanguageButtonsState extends State<LanguageButtons> {
  int _selectedIndex = 0;

  List<bool> _selections = List.generate(3, (_) => false);

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      verticalDirection: VerticalDirection.down,
      children: [
        Text('data1'),
        Text('data2'),
        Text('data3'),
      ],
      isSelected: _selections,
      onPressed: (index) {
        setState(() {
          _selectedIndex = index;
          _selections[index] = true;
          for (int i = 0; i < _selections.length; i++) {
            if (i != index) {
              _selections[i] = false;
            }
          }
          switch (index) {
            case 0:
              // Set the app's locale to English
              break;
            case 1:
              // Set the app's locale to Spanish
              break;
            case 2:
              // Set the app's locale to French
              break;
          }
        });
      },
    );
  }
}
