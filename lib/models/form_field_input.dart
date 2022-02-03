import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormFieldInput {
  String? label;
  bool fullRow;
  TextEditingController? controller;
  TextInputType type;
  bool dateOnly;
  IconData icon;
  Widget? iconWidget;
  bool obscureText;
  bool enabled;
  String? placeholder;
  String? initialValue;
  DateTime? initialDateValue;
  List<TextInputFormatter>? inputFormatters;
  int? minLines;
  int? maxLines;
  int? maxChar;
  FocusNode? focusNode;
  bool secondary;
  DateTime? minimumDate;
  Function()? onSave;
  Function(String value)? onChanged;
  Function(DateTime? value)? onChangedDate;
  Function(String value)? onSubmit;

  FormFieldInput(
      {this.label,
      this.fullRow = true,
      this.type = TextInputType.text,
      this.icon = Icons.info_outline,
      this.iconWidget,
      this.placeholder,
      this.dateOnly = false,
      this.enabled = true,
      this.obscureText = false,
      this.onSubmit,
      this.secondary = false,
      this.minimumDate,
      this.onSave,
      this.minLines,
      this.maxLines,
      this.maxChar,
      this.inputFormatters,
      this.onChanged,
      this.onChangedDate,
      this.focusNode,
      this.initialValue}) {
    controller = TextEditingController(text: initialValue);
    focusNode ??= FocusNode();

    if (onChanged != null && initialValue != null) {
      onChanged!(initialValue!);
    }
  }
}
