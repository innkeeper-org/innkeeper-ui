import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:frontend/front_office/models/create_reservation_model.dart';
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
                        child: FormBuilderTextField(
                            name: "Name",
                            decoration: const InputDecoration(labelText: "Name"),
                            initialValue: guestInfo.name,
                            onChanged: (value) {
                              guestInfo.name = value!;
                            },
                            validator: FormBuilderValidators.compose(
                                [FormBuilderValidators.required()]))),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: FormBuilderTextField(
                          name: "Phone",
                          initialValue: guestInfo.phone.toString(),
                          decoration: const InputDecoration(labelText: "Phone"),
                          onChanged: (value) {
                            guestInfo.phone = value!;
                          },
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.phoneNumber()
                          ])),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: FormBuilderTextField(
                          name: "Email",
                          initialValue: guestInfo.email.toString(),
                          decoration: const InputDecoration(labelText: "Email"),
                          onChanged: (value) {
                            guestInfo.email = value!;
                          },
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.email()
                          ])),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: FormBuilderTextField(
                            name: "Address",
                            initialValue: guestInfo.address.toString(),
                            decoration: const InputDecoration(labelText: "Address"),
                            onChanged: (value) {
                              guestInfo.address = value!;
                            },
                            validator: FormBuilderValidators.compose(
                                [FormBuilderValidators.required()]))),
                  ],
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
