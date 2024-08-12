import 'package:eventa_project/color.dart';
import 'package:eventa_project/view/widgets/publicevent/custom_veiw_My%20event%20.dart';



import 'package:eventa_project/view/widgets/publicevent/custom_veiw_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Veiw_mypublicEvents extends ConsumerWidget {
  Veiw_mypublicEvents({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
 
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Events",
          style: TextStyle(fontSize: 31, color: Appcolor.white),
        ),
      ),
      body: Custom_Veiw_Myevent (),
    );
  }
}
