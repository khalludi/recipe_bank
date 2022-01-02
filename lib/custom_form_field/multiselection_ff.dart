import 'package:flutter/material.dart';

import 'multiselection_field.dart';

class MyMultiSelectionFormField<T> extends FormField<List<T>> {

  final InputDecoration decoration;

  MyMultiSelectionFormField({
    Key? key,
    this.decoration = const InputDecoration(),
    FormFieldSetter<List>? onSaved,
    FormFieldValidator<List>? validator,
    List<T>? initialValue,
  }) : super(key: key,
      onSaved: onSaved,
      validator: validator,
      initialValue: initialValue,
      builder: (FormFieldState<List> field) {
        final InputDecoration effectiveDecoration =
          decoration.applyDefaults(
            Theme.of(field.context).inputDecorationTheme,
          );
        return InputDecorator(
          decoration: effectiveDecoration.copyWith(errorText: field.errorText),
          isEmpty: field.value?.isEmpty ?? true,
          child: MyMultiSelectionField(
            values: field.value?.map((e) => e.toString()).toList() ?? [],
            onChanged: field.didChange,
          ),
        );
      }
  );
}