import 'package:eventa_project/color.dart';
import 'package:eventa_project/data/model/create_event_model.dart';
import 'package:eventa_project/view/widgets/publicevent/custom_create_image.dart';
import 'package:eventa_project/view/widgets/publicevent/custom_menu.dart';
import 'package:eventa_project/view/widgets/publicevent/custom_textfield.dart';
import 'package:eventa_project/view/widgets/publicevent/custom_textfield_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreatePublicEvent extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final event = ref.watch(eventProvider);
    final eventNotifier = ref.read(eventProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        
        title: const Text(
          'Create Public Event',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CustomCreateEvent(
                context: context,
                event: event,
                eventNotifier: eventNotifier,
              ),
              const SizedBox(height: 20),
              TextField(
                onChanged: (value) => eventNotifier.setnName(value),
                decoration: const InputDecoration(
                  labelText: 'Name Event',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(400),
                          left: Radius.circular(50))),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF5669ff),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              TextField(
                onChanged: (value) => eventNotifier.setDescription(value),
                decoration: const InputDecoration(
                  labelText: 'Event Description',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF5669ff),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              //===================================================
              custom_TextField_Date(event: event, eventNotifier: eventNotifier),
              const SizedBox(height: 20),
              Custom_TextField(
                eventNotifier: eventNotifier,
                textInputType: TextInputType.number,
                labelText: 'Number of Seats',
              ),
              const SizedBox(height: 20),
              TextField(
                onChanged: (value) =>
                    eventNotifier.setPrice(double.parse(value)),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Ticket Price',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF5669ff),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              custom_menu(event: event, eventNotifier: eventNotifier),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                 
                  final description = event.description;
                  final dateTime = event.dateTime;
                  final seats = event.seats;
                  final price = event.price;
                  final category = event.category;

                 
                  print('Description: $description');
                  print('Date & Time: $dateTime');
                  print('Seats: $seats');
                  print('Price: $price');
                  print('Category: $category');
                },
                
                style: ButtonStyle(
                  fixedSize: WidgetStateProperty.all(const Size(200, 60)),
                  overlayColor:
                      WidgetStateProperty.all(const Color.fromARGB(255, 5, 24, 168)),
                  backgroundColor:
                      WidgetStateProperty.all(const Color(0xFF5669ff)),
                ),
                child: const Text(
                  'Create Event',
                  style: TextStyle(color: Appcolor.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
