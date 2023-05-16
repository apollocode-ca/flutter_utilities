import 'package:apollocode_flutter_utilities/services/event.dart';
import 'package:eventify/eventify.dart';
import 'package:flutter/material.dart';

/// Class to bind [Event]s to widgets and functions efficiently.
///
/// Documentation: https://docs.google.com/document/d/1HtFJf06JWew7rlgf3GNtgCO3r-gYR574rsZdDEUOM60
///
/// INITIALIZE
/// Must be initialized in a service like that:
///   EventBinding<{the type you want}> event1 = EventBinding<{the type you want}>(event: "events/event1").
/// The name of the event must be relevant and the string of the event must be in the
/// format "category/eventName".
///
/// The [EventBinding] entity will treat data as a nullable of the type of data
/// you choose on initialization
///
/// SENDERS
/// You must register all the senders of the event like this in the initialize
/// function of the component like this:
///   services.events.event1.registerSender(sender: this).
///
/// You must unregister all the senders of the event in the disposal function
/// of the component like this:
///   services.events.event1.unregisterSender(sender: this).
///
///
/// Registering senders won't affect events running, but will widely help debugging and
/// monitoring.
///
/// To send a signal to an event, you must male a call where you need in a sender
/// like this:
///   services.events.event1.sendEvent(sender: this),
/// or like this if you need to send data:
///   services.events.event1.sendEvent(sender: this, data: data).
///
/// RECEIVERS
/// You must register all receivers with their binded functions in the inistate
/// function like this:
///   services.events.event1.bindEvent(receiver: this, context: context, bindFunction: bindFunction),
/// or like that if you need the data provided by the event:
///   services.events.event1.bindEventWithData(receiver: this, context: context, bindFunction: bindFunction).
///
/// You must unregister all receivers in the dispose function like this:
///   services.events.event1.unbindEvents(receiver: this).
///
/// The data provided by an event will be a nullable of the type you choose on
/// initialization. You must treat if the data is null or not in the widget.
class EventBinding<T> {
  /// The [String] of the name of the event. Standard: category/action.
  String event;

  /// The list of [senders] registered on the [Event]
  List<dynamic> senders = [];

  /// The list of [receivers] and their functions registered to the [Event]
  Map<dynamic, List<Function(Event event, Object? context)>> receivers = {};

  /// [EventBinding] entity constructor.
  /// [event] - [Event] : [String] of the name of the event. Standard: category/action.
  EventBinding({
    required this.event,
  });

  /// Registers a [sender] to the [senders] list of the [Event]
  void registerSender({
    required dynamic sender,
  }) {
    // Security to be sure not to add a sender twice
    if (senders.contains(sender)) {
      return;
    }
    senders.add(sender);
  }

  /// Unegisters a [sender] to the [senders] list of the [Event]
  void unregisterSender({
    required dynamic sender,
  }) {
    senders.remove(sender);
  }

  /// Binds a simple [bindFunction] from the chosen [receiver] to the [Event]
  void bindEvent({
    required dynamic receiver,
    required BuildContext context,
    required Function() bindFunction,
  }) {
    // Initialize the receiver if it's not yet
    receivers[receiver] ??= [];
    // Adds the event function to call when the event is triggered
    receivers[receiver]!.add((Event event, Object? context) {
      // Event sending
      return bindFunction();
    });
    EventService.emitter.on(event, context, receivers[receiver]!.last);
  }

  /// Binds a [bindFunction] with a [T] data from the chosen [receiver] to the [Event]
  void bindEventWithData({
    required dynamic receiver,
    required BuildContext context,
    required Function(T? data) bindFunction,
  }) {
    // Initialize the receiver if it's not yet
    receivers[receiver] ??= [];
    // Adds the event function to call when the event is triggered
    receivers[receiver]!.add((Event event, Object? context) {
      // Data conversion
      T? data = event.eventData as T?;
      // Event sending
      return bindFunction(data);
    });
    EventService.emitter.on(event, context, receivers[receiver]!.last);
  }

  /// Unbind all the functions of the chosen [receiver] from the [Event]
  void unbindEvents({
    required dynamic receiver,
  }) {
    // Retrieves all the receiver's callbacks
    final callbacks = receivers[receiver];
    if (callbacks == null || callbacks.isEmpty) {
      return;
    }

    // Callbacks unbinding
    for (final callback in callbacks) {
      EventService.emitter.removeAllByCallback(callback);
    }

    // Receiver reset
    receivers.remove(receiver);
  }

  /// Sends [data] from the [sender] to the [Event]
  void sendEvent({required dynamic sender, T? data}) {
    //Registers the sender if it's not registered yet
    registerSender(sender: sender);
    EventService.emitter.emit(event, sender, data);
  }
}
