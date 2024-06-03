
import 'package:eventa_project/data/model/create_event_model.dart';
import 'package:flutter/material.dart';


class custom_TextField_Date extends StatelessWidget {
  const custom_TextField_Date({
    super.key,
    required this.event,
    required this.eventNotifier,
  });

  final Event event;
  final EventNotifier eventNotifier;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(text: event.dateTime),
      decoration: const InputDecoration(
        labelText: 'Date & Time',
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF5669ff),
          ),
        ),
      ),
      onTap: () async {
        FocusScope.of(context).requestFocus(new FocusNode());
        DateTime? date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );
        if (date != null) {
          TimeOfDay? time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          );
          if (time != null) {
            eventNotifier.setDateTime(
                "${date.year}-${date.month}-${date.day} T ${time.hour}:${time.minute}");
          }
        }
      },
    );
  }
}
