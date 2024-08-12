
import 'package:eventa_project/color.dart';
import 'package:eventa_project/controller/attendance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AttendanceListScreen extends ConsumerWidget {
  const AttendanceListScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref ) {
    final attendanceList =ref. watch(attendanceNotifierProvider).attendanceList;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Attendance', style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        itemCount: attendanceList.length,
        itemBuilder: (BuildContext context, int index) {
        
          return Column(
            children: [
              ListTile(
                
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/logo.png"),
                ),
                title: Text(attendanceList[index].username),
                subtitle: Text('Seats Reserved: ${attendanceList[index].seatsReserved}'),
                trailing: Text('Price: ${attendanceList[index].price}'),
              ),
                const Divider(height: 0.5
                ,color:Appcolor.grey )
            ],
          );
        },
        
      ),
    );
  }
}
