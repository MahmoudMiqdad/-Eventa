
import 'package:eventa_project/data/model/create_event_model.dart';
import 'package:flutter/material.dart';


class Custom_TextField extends StatelessWidget {
  const Custom_TextField({
    super.key,
    required this.eventNotifier, required this.textInputType, this.labelText,
    
  });

  final EventNotifier eventNotifier;
    final TextInputType textInputType;
     final  labelText;  
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) =>
          eventNotifier.setSeats(int.parse(value)),
      keyboardType: textInputType,
      decoration:  InputDecoration(
        
        border: OutlineInputBorder(),
        labelText: labelText,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF5669ff),
          ),
        ),
      ),
    );
  }
}
