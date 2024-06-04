import 'package:eventa_project/color.dart';
import 'package:eventa_project/controller/ticket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class TicketsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tickets = ref.watch(ticketsProvider);

    return Scaffold(
      appBar: AppBar(
          elevation: 40,
iconTheme: const IconThemeData(color: Appcolor.white),
        title: const Text('My Tickets',style: TextStyle(color: Appcolor.white),),
        backgroundColor: Appcolor.appBar,
      ),
      body: ListView.builder(
        itemCount: tickets.length,
        itemBuilder: (context, index) {
          final ticket = tickets[index];
          return Card(
           elevation: 10,
           shadowColor: Appcolor.mainColor,
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              trailing: const CircleAvatar(
               
                radius: 50,
               backgroundColor: Appcolor.white,
                foregroundColor: Appcolor.appBar,
                backgroundImage: AssetImage('assets/images/logo.png'),
              ), 
              title: Text(ticket.eventName, style: const TextStyle(color: Color(0xFF4A43EC))),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Seats: ${ticket.seats}'),
                  Text('Price: \$${ticket.price.toStringAsFixed(2)}'),
                  Text('Date: ${ticket.eventDate.toLocal()}'), 
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
