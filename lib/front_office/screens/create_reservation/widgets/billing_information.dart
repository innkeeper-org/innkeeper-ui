import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:frontend/front_office/models/create_reservation_model.dart';
import 'package:frontend/front_office/screens/create_reservation/widgets/custom_form_text_field.dart';
import 'package:provider/provider.dart';

class BillingInformationWidget extends StatelessWidget {

  final _formKey = GlobalKey<FormBuilderState>();

  BillingInformationWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
        key: _formKey,
        child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            runAlignment: WrapAlignment.spaceBetween,
            children: [BillingInformationDetailsCard(formKey: _formKey)]));
  }
}

class BillingInformationDetailsCard extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  const BillingInformationDetailsCard({required this.formKey, super.key});
  @override
  Widget build(BuildContext context) {
    final billInfo = Provider.of<CreateReservationModel>(context).billing;
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
                Text("Billing Information", style: theme.textTheme.bodyLarge),
                const Divider(thickness: 2),
                Row(
                  children: [
                    Expanded(
                        child: CustomFormTextField(
                            name: "Invoice",
                            value: billInfo.invoiceNumber,
                            onChanged: (value) {
                              billInfo.invoiceNumber = value!;
                            },
                            validators: [FormBuilderValidators.required()])),
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
                      debugPrint(billInfo.toJson().toString());
                    })
              ]),
        ));
  }
}
