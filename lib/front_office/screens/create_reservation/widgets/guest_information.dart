import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:frontend/front_office/models/create_reservation_model.dart';
import 'package:frontend/front_office/screens/create_reservation/widgets/custom_form_text_field.dart';
import 'package:provider/provider.dart';

class GuestRegistrationWidget extends StatelessWidget {
  GuestRegistrationWidget({super.key});
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
        key: _formKey,
        child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            runAlignment: WrapAlignment.spaceBetween,
            children: [GuestBasicDetailsCard(formKey: _formKey)]));
  }
}

class GuestBasicDetailsCard extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  const GuestBasicDetailsCard({required this.formKey, super.key});
  @override
  Widget build(BuildContext context) {
    final guestInfo = Provider.of<CreateReservationModel>(context).guest;
    ThemeData theme = Theme.of(context);
    return Card(
        color: theme.cardColor,
        elevation: 1,
        child: Container(
          width: 800,
          padding: const EdgeInsets.all(15),
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
                            value: guestInfo.name,
                            onChanged: (value) {
                              guestInfo.name = value!;
                            },
                            validators: [FormBuilderValidators.required()])),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomFormTextField(
                          name: "Phone",
                          value: guestInfo.phone,
                          onChanged: (value) {
                            guestInfo.phone = value!;
                          },
                          validators: [
                            FormBuilderValidators.required(),
                            FormBuilderValidators.phoneNumber()
                          ]),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: CustomFormTextField(
                          name: "Email",
                          value: guestInfo.email,
                          onChanged: (value) {
                            guestInfo.email = value!;
                          },
                          validators: [
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
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                    color: Colors.blueAccent,
                    child: const Text("Save"),
                    onPressed: () {
                      formKey.currentState?.validate();
                      debugPrint(guestInfo.toJson().toString());
                    })
              ]),
        ));
  }
}
