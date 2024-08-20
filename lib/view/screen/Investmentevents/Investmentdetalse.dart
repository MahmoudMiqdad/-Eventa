import 'package:eventa_project/color.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Investmentdetals extends StatelessWidget {
  

  final String description;
  final String start_date;
  final String address;
  final String endDate;
  final String reservePrice;

  Investmentdetals({
    super.key,
 
    required this.description,
    required this.start_date,
    required this.endDate,
    required this.address, required this.reservePrice,
  });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Event Details'),
        // ),
        body: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Event Image Placeholder
              Container(
                width: double.infinity,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/test2.webp'),
                      fit: BoxFit.fill),
                ),
                
              ),
              const SizedBox(height: 16),
              // Date and Place Info
              Center(
                child: Text(
                  'Address: ${address}',
                  style: const TextStyle(
                    fontSize: 25,
                    color: Appcolor.mainColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Start Date : ${start_date}',
                  style: const TextStyle(
                    fontSize: 15,
                     fontWeight: FontWeight.bold,
                  ),
                ),
              ),
               const SizedBox(height: 10),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text(
                  'End Date : ${endDate}',
                  style: const TextStyle(
                    fontSize: 15,
                     fontWeight: FontWeight.bold,
                  ),
                               ),
               ),
              
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'reservePrice: ${reservePrice}',
                  style: const TextStyle(
                    fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),

              // Divider
              const Divider(
                color: Appcolor.appBar,
              ),
              // Event Description
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  description, // Display event description
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              
              // Purchase Ticket Button
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
