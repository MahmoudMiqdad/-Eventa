
import 'package:eventa_project/data/model/attendance_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AttendanceNotifier extends ChangeNotifier {
  List<Attendance> _attendanceList = [
    Attendance(
      username: 'Mohammed',
      imageUrl: 'assets/images/user1.jpg',
      seatsReserved: 3,
      price: 150.0,
    ),
    Attendance(
      username: 'Ahmed',
      imageUrl: 'assets/images/user2.jpg',
      seatsReserved: 2,
      price: 100.0,
    ),
    
  ];

  List<Attendance> get attendanceList => _attendanceList;


  void updateAttendanceList(List<Attendance> newList) {
    _attendanceList = newList;
    notifyListeners();
  }
}

// Create a Provider for AttendanceNotifier
final attendanceNotifierProvider = ChangeNotifierProvider((ref) => AttendanceNotifier());
