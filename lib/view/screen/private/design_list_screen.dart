// screens/hall_details_screen.dart
import 'package:eventa_project/color.dart';
import 'package:eventa_project/controller/hall.dart';
import 'package:eventa_project/data/model/hall_model.dart';
import 'package:eventa_project/view/screen/Service_page/service_mainpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HallDetailsScreen extends ConsumerStatefulWidget {
  final Hall hall;

  HallDetailsScreen({required this.hall});

  @override
  _HallDetailsScreenState createState() => _HallDetailsScreenState();
}

class _HallDetailsScreenState extends ConsumerState<HallDetailsScreen> {
  TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  void _showDateDialog(BuildContext context, Design design) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          
          elevation: 40,
          shadowColor: Appcolor.mainColor,
          title: const Text('Choose the date '),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _dateController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Enter the date ',
                  suffixIcon: Icon(Icons.calendar_today,color: Appcolor.mainColor,),
                ),
                onTap: () {
                  _selectDate(context);
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showConfirmationDialog(context);
                // _confirmSelection(context, design);
              },
              child: const Text('Confirmation',
                  style: TextStyle(color: Appcolor.mainColor)),
            ),
          ],
        );
      },
    );
  }

  // Future<void> _confirmSelection(BuildContext context, Design design) async {
  //   // أرسل البيانات إلى الباك اند
  //   final response = await http.post(
  //     Uri.parse('https://example.com/api/booking'), // استبدل برابط API الخاص بك
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'design': design.image,
  //       'date': _dateController.text,
  //     }),
  //   );

  //   if (response.statusCode == 200) {
  //     Navigator.of(context).pop(); // أغلق مربع الحوار الأول
  //     _showConfirmationDialog(context);
  //   } else {
  //     // التعامل مع الخطأ
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('حدث خطأ أثناء إرسال الطلب.')),
  //     );
  //   }
  // }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 10,
          shadowColor: Appcolor.mainColor,
          title: const Text('Thank you'),
          content: const Text(
            'Your application has been sent and is now under consideration',
            style: TextStyle(fontSize: 15),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ServiceProviderApp(),
                  ),
                );
              },
              child: const Text('Service Providers',
                  style: TextStyle(color: Appcolor.mainColor)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.hall.name,
          style: TextStyle(color: Appcolor.white),
        ),
      ),
      body: Column(
        children: [
          RatingBar.builder(
            initialRating: widget.hall.rating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              ref.read(hallProvider.notifier).updateRating(widget.hall, rating);
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.hall.designs.length,
              itemBuilder: (context, index) {
                final design = widget.hall.designs[index];
                return GestureDetector(
                  onTap: () {
                    _showDateDialog(context, design);
                  },
                  child: Card(
                    elevation: 8,
                    shadowColor: Appcolor.mainColor,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Image.asset(design.image),
                        Text(
                          'Number of chairs: ${design.chairs}',
                          style: TextStyle(
                              color: Appcolor.mainColor, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
