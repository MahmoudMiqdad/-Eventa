import 'package:eventa_project/color.dart';
import 'package:eventa_project/view/screen/my_events/public/event_attendance.dart';
import 'package:flutter/material.dart';


class Custom_Veiw_Myevent extends StatelessWidget {
  Custom_Veiw_Myevent ({super.key});
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
       {
      'image': 'assets/images/sunny.png',
      'name': 'Food Carnival',
      'date': '2024-08-15',
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
        return GestureDetector(
          onTap:(){
         Navigator.push(context, MaterialPageRoute(builder:(context)=>const AttendanceListScreen() ));
          } ,
          child: Card(
            
            elevation: 5,
            shadowColor: Appcolor.mainColor,
            margin: const EdgeInsets.all(10),
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
                  child: Row(
                    children: [
                  
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            event['date']!,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Appcolor.mainColor,
                            ),
                          ),
                          const SizedBox(height: 15,),
                          Text(
                            event['name']!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            event['location']!,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                 
                        Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: GestureDetector(
                            onTap: (){
                              
                            },
                            child: Text('Delete',style: TextStyle(color:const Color.fromARGB(193, 244, 67, 54),fontSize: 15),)),
                        ),
                         
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
