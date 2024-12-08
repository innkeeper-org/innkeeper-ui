import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:frontend/util/colors.dart';

class CustomFormTextField extends StatelessWidget {

  final String name;
  final List<FormFieldValidator<String>> validators;

  const CustomFormTextField({super.key,
    required this.name,
    required this.validators
});

  @override
  Widget build(BuildContext context) {
    return
      FormBuilderTextField(
        name: name,
        decoration: InputDecoration(
            labelText: name,
            filled: true,
            fillColor: AppColors.formField,
            focusColor: AppColors.formField,
            hoverColor: AppColors.formField,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                    color: AppColors.formField,
                    width: 1
                )
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                    color: AppColors.formField,
                    width: 1
                )
            )
        ),
        validator: FormBuilderValidators.compose(validators),
      );
  }

}