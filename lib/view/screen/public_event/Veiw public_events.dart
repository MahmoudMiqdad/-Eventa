import 'package:eventa_project/color.dart';
import 'package:eventa_project/cubit/public_event_cubit/cubit.dart';
import 'package:eventa_project/cubit/public_event_cubit/state.dart';
import 'package:eventa_project/view/screen/public_event/EventDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VeiwpublicEvents extends ConsumerWidget {
  VeiwpublicEvents({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
 
    return BlocConsumer<Pupliceventcubit, Pupliceventstate>(
      listener: (context, state) {
        if (state is GetEventFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
        title: Text(
          "Events",
          style: TextStyle(fontSize: 31, color: Appcolor.white),
        ),
      ),
          body: state is GetEventLoading
              ? const CircularProgressIndicator()
              : state is GetEventSuccess
                  ? ListView.builder(
      itemCount: state.event.data.length,
      itemBuilder: (context, index) {
        final events=state.event.data[index];
        return GestureDetector(
        //   onTap:(){
        //  Navigator.push(context, MaterialPageRoute(builder:(context)=>AttendanceListScreen() ));
        //   } ,
          child: GestureDetector(
            onTap: (){
               Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EventDetailsScreen()),
                );
            },
            child: Card(
              
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
                          image: AssetImage(events.image),
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
                         events.date!,
                          style: TextStyle(
                            fontSize: 16,
                            color: Appcolor.mainColor,
                          ),
                        ),
                        SizedBox(height: 15,),
                        Text(
                         events.name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          events.address,
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
            ),
          ),
        );
      },
    )
                  : Container(child:Text('555555555555555555555555555555555555555555555555'),),
        );
      },
    );
  }
}
