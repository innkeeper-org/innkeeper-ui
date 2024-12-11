import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:frontend/front_office/screens/create_reservation/widgets/CustomFormTextField.dart';
import 'package:frontend/front_office/screens/create_reservation/widgets/RoomInformationDetailsItem.dart';

class RoomInformationWidget extends StatefulWidget {
  @override
  _RoomInformationFormState createState() => _RoomInformationFormState();
}

class _RoomInformationFormState extends State<RoomInformationWidget> {
  @override
  Widget build(BuildContext context) {
    return const FormBuilder(
        child: Wrap(
      alignment: WrapAlignment.spaceBetween,
      runAlignment: WrapAlignment.spaceBetween,
      children: [RoomInformationDetails()],
    ));
  }
}

class RoomInformationDetails extends StatelessWidget {
  const RoomInformationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Card(
      color: theme.cardColor,
      elevation: 1,
      child: SizedBox(
        width: 800,
        height: 500,
        child: ListView(
          children: [RoomInformationDetailsItem(), RoomInformationDetailsItem()],
        ),
      ),
    );
  }
}
