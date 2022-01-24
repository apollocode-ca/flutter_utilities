import 'package:apollocode_flutter_utilities/models/form_field_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class InputField extends StatefulWidget {
  final FormFieldInput config;

  const InputField(this.config, {Key? key}) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
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

    return Padding(
      padding: const EdgeInsets.only(top: 0, bottom: 10),
      child: TextField(
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
            : GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.bold),
        onSubmitted: widget.config.onSubmit,
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
