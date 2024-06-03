import 'package:eventa_project/color.dart';
import 'package:flutter/material.dart';

class Customveiwevent extends StatelessWidget {
  Customveiwevent({super.key});
  final List<Map<String, String>> events = [
    {
      'image': 'assets/images/sunny.png',
      'name': 'Music Festival',
      'date': '2024-06-01',
      'location': 'bosra'
    },
    {
      'image': 'assets/images/sunny.png',
      'name': 'Art Exhibition',
      'date': '2024-07-10',
      'location': 'bosra'
    },
    {
      'image': 'assets/images/sunny.png',
      'name': 'Food Carnival',
      'date': '2024-08-15',
      'location': 'bosra'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        return Card(
          elevation: 5,
          shadowColor: Appcolor.mainColor,
          margin: EdgeInsets.all(10),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 92,
                  width: 72,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(event['image']!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event['date']!,
                      style: TextStyle(
                        fontSize: 16,
                        color: Appcolor.mainColor,
                      ),
                    ),
                    SizedBox(height: 15,),
                    Text(
                      event['name']!,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      event['location']!,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
