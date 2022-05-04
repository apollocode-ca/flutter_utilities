import 'package:apollocode_flutter_utilities/models/form_field_input.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class InputFormField extends StatefulWidget {
  final String? Function(String?)? validator;
  final FormFieldInput config;

  const InputFormField(this.config, {Key? key, this.validator})
      : super(key: key);

  @override
  State<InputFormField> createState() => _InputFormFieldState();
}

class _InputFormFieldState extends State<InputFormField> {
  bool hasListeners = false;

  @override
  void initState() {
    super.initState();
    if (widget.config.focusNode != null) {
      widget.config.focusNode!.addListener(() {
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.config.focusNode != null) {
      widget.config.focusNode!.removeListener(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.config.controller != null && !hasListeners) {
      setState(() {
        hasListeners = true;
      });

      widget.config.controller!.addListener(() {
        if (widget.config.onChanged != null) {
          widget.config.onChanged!(widget.config.controller!.text);
        }
      });
    }

    if (widget.config.type == TextInputType.datetime) {
      FormFieldInput temp = widget.config;
      temp.type = TextInputType.text;
      // temp.enabled = false;
      temp.iconWidget = const Icon(Icons.calendar_today);
      return DateTimePicker(
        type: (widget.config.dateOnly)
            ? DateTimePickerType.date
            : DateTimePickerType.dateTime,
        firstDate: (widget.config.minimumDate != null)
            ? widget.config.minimumDate
            : DateTime(1970, 01, 01),
        lastDate: DateTime(2100, 07, 07),
        initialDate: widget.config.initialDateValue,
        initialValue: (widget.config.controller != null)
            ? null
            : widget.config.initialDateValue.toString(),
        controller: widget.config.controller,
        enabled: widget.config.enabled,
        onChanged: (String value) {
          if (widget.config.onChangedDate != null) {
            widget.config.onChangedDate!(DateTime.tryParse(value.toString()));
          }
        },
        decoration: (widget.config.enabled)
            ? InputDecoration(
                suffixIcon: widget.config.iconWidget,
                hintText: widget.config.label,
                labelText:
                    (widget.config.secondary) ? widget.config.label : null,
                hintStyle: GoogleFonts.poppins(
                    color: (widget.config.focusNode!.hasFocus)
                        ? Theme.of(context).colorScheme.secondary
                        : ((widget.config.secondary)
                            ? Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(0.70)
                            : Colors.white)),
                fillColor: (widget.config.focusNode!.hasFocus)
                    ? Colors.white
                    : ((widget.config.secondary)
                        ? Colors.white
                        : Colors.transparent)
                // labelText: widget.config.label,
                )
            : InputDecoration(
                fillColor: Theme.of(context).disabledColor,
                suffixIcon: widget.config.iconWidget,
                hintText: widget.config.label,
                hintStyle: GoogleFonts.poppins(color: Colors.white),
              ),
        style: GoogleFonts.poppins(
            color: (widget.config.focusNode!.hasFocus)
                ? Theme.of(context).colorScheme.secondary
                : ((widget.config.secondary)
                    ? Theme.of(context).colorScheme.secondary.withOpacity(0.70)
                    : Colors.white)),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 0, bottom: 10),
      child: TextFormField(
        validator: widget.validator,
        focusNode: widget.config.focusNode,
        controller: widget.config.controller,
        keyboardType: widget.config.type,
        obscureText: widget.config.obscureText,
        enabled: widget.config.enabled,
        minLines: widget.config.minLines,
        maxLines: widget.config.maxLines,
        style: (widget.config.enabled)
            ? GoogleFonts.poppins(
                color: (widget.config.focusNode!.hasFocus)
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.primary.withOpacity(0.85))
            : GoogleFonts.poppins(
                color: Colors.black, fontWeight: FontWeight.bold),
        // onSubmitted: widget.config.onSubmit,
        onChanged: widget.config.onChanged,
        maxLength: widget.config.maxChar,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        inputFormatters: widget.config.inputFormatters,
        textAlign: TextAlign.left,
        decoration: (widget.config.enabled)
            ? InputDecoration(
                suffixIcon: widget.config.iconWidget,
                hintText: widget.config.label,
                hintStyle: GoogleFonts.poppins(
                    color: (widget.config.focusNode!.hasFocus)
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.5)),
                fillColor: Colors.white,
                focusColor: Theme.of(context).colorScheme.primary
                // labelText: widget.config.label,
                )
            : InputDecoration(
                fillColor: Theme.of(context).disabledColor,
                suffixIcon: widget.config.iconWidget,
                hintText: widget.config.label,
                hintStyle: GoogleFonts.poppins(color: Colors.white),
              ),
        cursorColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
