import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:frontend/util/colors.dart';

class CustomFormTextField extends StatelessWidget {
  final String name;
  final String value;
  final List<FormFieldValidator<String>> validators;
  final void Function(String?) onChanged;

  const CustomFormTextField(
      {super.key,
      required this.name,
      required this.value,
      required this.onChanged,
      required this.validators});

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      initialValue: value,
      onChanged: (value) {
        onChanged(value);
      },
      decoration: InputDecoration(labelText: name),
      validator: FormBuilderValidators.compose(validators),
    );
  }
}
