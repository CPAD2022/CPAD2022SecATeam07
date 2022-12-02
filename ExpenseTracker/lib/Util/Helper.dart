import 'dart:ui';
import 'package:budget_tracker_ui/json/budget_json.dart';
import 'package:budget_tracker_ui/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../pages/root_app.dart';
TextEditingController _category =
TextEditingController(text: "");
TextEditingController _amount = TextEditingController(text: "");
void getToast(String msg){
  var fluttertoast=Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM, // Also possible "TOP" and "CENTER"
      backgroundColor: white,
      textColor: black);

}
Widget getbuildPopupDialog(BuildContext context, RootApp root) {
  return AlertDialog(
    title: const Text('Popup example'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Category",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13,
              color: Color(0xff67727d)),
        ),
        TextField(
          controller: _category,
          cursorColor: black,
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: black),
          decoration: InputDecoration(
              hintText: "Please enter category", border: InputBorder.none),
        ),
        Text(
          "Amount",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13,
              color: Color(0xff67727d)),
        ),
        TextField(
          controller: _amount,
          cursorColor: black,
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: black),
          decoration: InputDecoration(
              hintText: "Please enter amount", border: InputBorder.none),
        ),
      ],
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
          if(validate()==true) {
            addDataToDB(budget_json);
            getToast("Budget successfully added");
            root.initializefragments();
          }
          else{
            getToast("Please Enter valid inputs");
          }
        },
        child: const Text('Confirm'),
      ),
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Cancel'),
      ),
    ],
  );

}

void addDataToDB(List budget_json) {
  var obj={"name": _category.text.toString(),
  "price": "\$"+_amount.text.toString(),
  "label_percentage": (double.parse(_amount.text.toString())/50).toString()+"%",
  "percentage": (double.parse(_amount.text.toString())/5000),
  "color": green
};
  print(obj);
  budget_json.add(obj);
}
bool validate(){
  var amount=_amount.text.toString();
  var category=_category.text.toString();
  if(amount==null || category==null)
    return false;
  if(amount.isEmpty || category.isEmpty)
  return false;
  return true;

}