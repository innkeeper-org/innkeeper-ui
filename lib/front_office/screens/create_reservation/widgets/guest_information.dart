import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:frontend/front_office/screens/create_reservation/widgets/CustomFormTextField.dart';
import 'package:frontend/util/colors.dart';

class GuestRegistrationWidget extends StatefulWidget {
  final Function(Map<String, String>) onSubmit;

  const GuestRegistrationWidget({Key? key, required this.onSubmit})
      : super(key: key);

  @override
  _GuestRegistrationFormState createState() => _GuestRegistrationFormState();
}

class GuestBasicDetailsCard extends StatelessWidget {
  const GuestBasicDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Card(
        color: theme.cardColor,
        elevation: 1,
        child: Container(
          width: 450,
          padding: EdgeInsets.all(15),
          child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                Text("Basic Details", style: theme.textTheme.bodyLarge),
                const Divider(thickness: 2),
                Row(
                  children: [
                    Expanded(
                        child: CustomFormTextField(
                            name: "First Name",
                            validators: [FormBuilderValidators.required()])),
                    Expanded(
                        child: CustomFormTextField(
                            name: "Last Name",
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
                )
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

class _GuestRegistrationFormState extends State<GuestRegistrationWidget> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _emailFieldKey = GlobalKey<FormBuilderFieldState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
        key: _formKey,
        child: const Wrap(
            alignment: WrapAlignment.spaceBetween,
            runAlignment: WrapAlignment.spaceBetween,
            children: [GuestBasicDetailsCard()]));
  }
}
