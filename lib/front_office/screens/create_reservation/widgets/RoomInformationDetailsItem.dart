import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/front_office/screens/create_reservation/widgets/CustomFormTextField.dart';

class RoomInformationDetailsItem extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        CustomFormTextField(name: "Room Type", onChanged: (e){}, validators: []),
        // CustomFormTextField(name: "Room Number", validators: []),
        // CustomFormTextField(name: "Adults", validators: []),
        // CustomFormTextField(name: "Children", validators: []),
        // CustomFormTextField(name: "Nights", validators: []),
        // CustomFormTextField(name: "Room Rate", validators: []),
        // CustomFormTextField(name: "Extra Charges", validators: []),
        // CustomFormTextField(name: "Discount", validators: []),
        // CustomFormTextField(name: "Tax", validators: []),
        // CustomFormTextField(name: "Amount", validators: []),
      ],
    );
  }
}