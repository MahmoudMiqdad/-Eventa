import 'package:eventa_project/view/screen/public_event/Veiw%20public_events.dart';
import 'package:flutter/material.dart';

class Customcategories extends StatelessWidget {
   Customcategories({super.key});
final List<Map<String, dynamic>> items = [
  {'color': Colors.red, 'icon': Icons.favorite, 'text': 'Music','id':1},
  {'color': Colors.green, 'icon': Icons.sports_basketball, 'text': 'Sports ','id':2},
  {'color': Colors.blue, 'icon': Icons.people_alt_sharp, 'text': 'Poetry ','id':3},
  {'color': Colors.orange, 'icon': Icons.lightbulb, 'text': 'Sports ','id':4},
  {'color': Colors.purple, 'icon': Icons.home, 'text': 'Music ','id':5},
];
  @override
  Widget build(BuildContext context) {
    return  Positioned(
            top: 217,
            left: 10,
            right: 10,
            child: SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                       Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>VeiwpublicEvents (categorieid: items[index]['id'],)),
                 
                );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      height: 60,
                      width: 120,
                      decoration: BoxDecoration(
                        color: items[index]['color'],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            items[index]['icon'],
                            color: Colors.white,
                          ),
                          const SizedBox(width: 2.0),
                          Text(
                            items[index]['text'],
                            style: const TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
  }
}