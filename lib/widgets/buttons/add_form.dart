import 'package:apollocode_flutter_utilities/services/event.dart';
import 'package:eventify/eventify.dart';
import 'package:flutter/material.dart';

class AddFormButton extends StatefulWidget {
  final String submitEvent;
  final String validationEvent;
  final String text;
  const AddFormButton(this.submitEvent, this.validationEvent,
      {Key? key, this.text = "Ajouter"})
      : super(key: key);

  @override
  State<AddFormButton> createState() => _AddFormButtonState();
}

class _AddFormButtonState extends State<AddFormButton> {
  bool canSubmit = false;

  @override
  void initState() {
    super.initState();
    EventService.emitter.on(widget.validationEvent, context,
        (Event ev, Object? context) {
      setState(() {
        canSubmit = (ev.eventData ?? false) as bool;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    EventService.emitter.removeAllByEvent(widget.validationEvent);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
          onPressed: (canSubmit)
              ? () async {
                  EventService.emitter.emit(widget.submitEvent);
                }
              : null,
          child: Text(widget.text)),
    );
  }
}
