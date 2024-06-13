// import 'package:flutter/material.dart';
// import 'package:knife/core/constant/colors.dart';
// import 'package:knife/core/constant/constants.dart';

// class CustomDropDown extends StatefulWidget {
//   static String? chosenValue;
//   const CustomDropDown(
//       {Key? key,
//       this.items,
//       this.text = '',
//       this.fillColor = Colors.white,
//       this.onSave,
//       this.borderColor,
//       this.validator})
//       : super(key: key);
//   final List<String>? items;
//   final String text;
//   final Color? fillColor;
//   final Color? borderColor;
//   final Function(String?)? onSave;
//   final String? Function(String?)? validator;

//   @override
//   // ignore: library_private_types_in_public_api
//   _CustomDropDownState createState() => _CustomDropDownState();
// }

// class _CustomDropDownState extends State<CustomDropDown> {
//   // List<String>? categories = widget.items;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: screenHeight(context) * 0.08,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(screenWidth(context) * 0.09),
//         border: (widget.borderColor == null)
//             ? Border.all(color: Colors.transparent)
//             : Border.all(color: widget.borderColor!),
//         color: MyColors.textFeildColor,
//       ),
//       padding: const EdgeInsets.only(left: 10, right: 10),
//       child: DropdownButtonFormField(
//         icon: Row(
//           children: [
//             const Icon(
//               Icons.keyboard_arrow_down,
//               color: MyColors.colorBlue,
//               size: 30,
//             ),
//             SizedBox(
//               width: screenWidth(context) * 0.03,
//               height: screenHeight(context) * 0.03,
//               child: Image.asset("assets/icons/asset2.png"),
//             ),
//           ],
//         ),
//         iconEnabledColor: const Color.fromRGBO(148, 148, 148, 1),
//         decoration: const InputDecoration(
//           border: InputBorder.none,
//         ),
//         value: CustomDropDown.chosenValue,
//         items: widget.items?.map<DropdownMenuItem<String>>((String value) {
//           return DropdownMenuItem(
//             value: value,
//             child: Text(
//               value,
//               style: headingStyle.copyWith(
//                 color: MyColors.textColor,
//                 fontSize: (prefs.getString("lang") == "en")
//                     ? screenWidth(context) * 0.045
//                     : screenWidth(context) * 0.05,
//               ),
//             ),
//           );
//         }).toList(),
//         hint: Text(
//           widget.text,
//           style: headingStyle.copyWith(
//             color: MyColors.hinttext,
//             fontSize: (prefs.getString("lang") == "en")
//                 ? screenWidth(context) * 0.045
//                 : screenWidth(context) * 0.05,
//           ),
//         ),
//         onChanged: (String? value) {
//           setState(() {
//             CustomDropDown.chosenValue = value;
//           });
//         },
//         onSaved: widget.onSave,
//         validator: widget.validator,
//       ),
//     );
//   }
// }
