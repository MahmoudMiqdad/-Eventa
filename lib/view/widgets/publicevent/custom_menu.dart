
import 'package:eventa_project/data/model/create_event_model.dart';
import 'package:flutter/material.dart';


class custom_menu extends StatelessWidget {
  const custom_menu({
    super.key,
    required this.event,
    required this.eventNotifier,
  });

  final Event event;
  final EventNotifier eventNotifier;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: event.category,
      items: ['Music', 'Art', 'Tech', 'Sports', 'Food']
          .map((category) {
        return DropdownMenuItem<String>(
          value: category,
          child: Text(category),
        );
      }).toList(),
      onChanged: (value) => eventNotifier.setCategory(value),
      decoration: const InputDecoration(
        labelText: 'Category',
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF5669ff),
          ),
        ),
      ),
    );
  }
}