import 'package:eventa_project/color.dart';
import 'package:eventa_project/view/screen/public_event/cubit/cubit.dart';
import 'package:flutter/material.dart';

class EventDetailsPage extends StatelessWidget {
  final String date;
  final int id;
  final String location;
  final String description;
  final String image;
  final publiceventCubit event;

  EventDetailsPage({
    super.key,
    required this.date,
    required this.location,
    required this.description,
    required this.image,
    required this.id,
    required this.event,
  });

  final TextEditingController ticketscountcontroler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 80), // Space for the button
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Event Image Placeholder
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Date and Place Info
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      const Icon(
                        Icons.date_range,
                        color: Appcolor.appBar,
                        size: 35,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        date,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Appcolor.appBar,
                        size: 35,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        location,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Divider(color: Appcolor.appBar),
                // Event Description
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    description,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(height: 140),
                 Center(
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Purchase Tickets'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const Text('How many tickets do you want to buy?'),
                            const SizedBox(height: 16),
                            Row(
                              children: <Widget>[
                                const Text('Number of tickets:'),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                    controller: ticketscountcontroler,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('Buy'),
                            onPressed: () {
                              event.attendpublicevent(
                                context: context,
                                ticketscount: ticketscountcontroler.text,
                                publiceventid: id.toString(),
                              );
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Appcolor.mainColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'Buy Ticket',
                      style: TextStyle(color: Appcolor.white),
                    ),
                  ),
                ),
              ),
            ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
