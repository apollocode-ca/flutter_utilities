import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormFieldInput {
  String? label;
  bool fullRow;
  TextEditingController? controller;
  TextInputType type;
  IconData icon;
  Widget? iconWidget;
  bool obscureText;
  bool enabled;
  String? placeholder;
  String? initialValue;
  List<TextInputFormatter>? inputFormatters;
  int? minLines;
  int? maxLines;
  int? maxChar;
  FocusNode? focusNode;
  Function()? onSave;
  Function(String value)? onChanged;
  Function(String value)? onSubmit;

  FormFieldInput(
      {this.label,
      this.fullRow = true,
      this.type = TextInputType.text,
      this.icon = Icons.info_outline,
      this.iconWidget,
      this.placeholder,
      this.enabled = true,
      this.obscureText = false,
      this.onSubmit,
      this.onSave,
      this.minLines,
      this.maxLines,
      this.maxChar,
      this.inputFormatters,
      this.onChanged,
      this.focusNode,
      this.initialValue}) {
    controller = TextEditingController(text: initialValue);
    focusNode ??= FocusNode();

    if (onChanged != null && initialValue != null) {
      onChanged!(initialValue!);
    }
  }
}
