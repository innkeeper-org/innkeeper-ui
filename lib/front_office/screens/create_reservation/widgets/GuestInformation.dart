import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:frontend/front_office/models/GuestInformationModel.dart';
import 'package:frontend/front_office/screens/create_reservation/widgets/CustomFormTextField.dart';
import 'package:frontend/util/colors.dart';

class GuestRegistrationWidget extends StatefulWidget {
  // final GlobalKey<FormBuilderState> formKey;
  final GuestInformationModel guestInfo;
  const GuestRegistrationWidget({super.key, required this.guestInfo});

  @override
  _GuestRegistrationFormState createState() => _GuestRegistrationFormState();
}

class _GuestRegistrationFormState extends State<GuestRegistrationWidget> {

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
        key: GlobalKey<FormBuilderState>(),
        child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            runAlignment: WrapAlignment.spaceBetween,
            children: [GuestBasicDetailsCard(widget.guestInfo)]));
  }
}

class GuestBasicDetailsCard extends StatelessWidget {

  // final GlobalKey<FormBuilderState> _formKey;

  const GuestBasicDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Card(
        color: theme.cardColor,
        elevation: 1,
        child: Container(
          width: 800,
          padding: EdgeInsets.all(15),
          child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                Text("Guest Information", style: theme.textTheme.bodyLarge),
                const Divider(thickness: 2),
                Row(
                  children: [
                    Expanded(
                        child: CustomFormTextField(
                            name: "Name",
                            validators: [FormBuilderValidators.required()])),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomFormTextField(name: "Phone", validators: [
                        FormBuilderValidators.required(),
                        FormBuilderValidators.phoneNumber()
                      ]),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: CustomFormTextField(name: "Email", validators: [
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email()
                      ]),
                    ),
                  ],
                ),
                FormBuilderDateTimePicker(
                  name: "DOB",
                  decoration: const InputDecoration(labelText: "DOB"),
                  inputType: InputType.date,
                  initialEntryMode: DatePickerEntryMode.calendarOnly,
                ),
                SizedBox(height: 20,),
                MaterialButton(
                  color: theme.colorScheme.primary,
                    child: const Text("Save"),
                    onPressed: (){
                    _formKey.currentState?.validate();
                    debugPrint(_formKey.currentState?.instantValue.toString());
                })
              ]),
        ));
  }
}

// class GuestCompanyDetailsCard extends StatelessWidget {
//   const GuestCompanyDetailsCard({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     ThemeData theme = Theme.of(context);
//     return
//       Card(
//           color: theme.cardColor,
//           elevation: 1,
//           child: Container(
//               width: 700,
//               padding: EdgeInsets.all(15),
//               child: Column(
//                   children: [
//                     Text("Company Details", style: theme.textTheme.bodyLarge),
//                     Divider(thickness: 2),
//                     FormBuilderTextField(
//                         name: 'Company Name',
//                         decoration: const InputDecoration(labelText: 'Company Name')
//                     ),
//                     FormBuilderTextField(
//                       name: 'GSTIN',
//                       decoration: const InputDecoration(labelText: 'GSTIN'),
//                     ),
//                     FormBuilderTextField(
//                         minLines: 2,
//                         maxLines: 3,
//                         name: 'Company Address',
//                         decoration: const InputDecoration(labelText: "Company Address")
//                     )
//                   ]
//               )
//           ));
//   }
//
// }
