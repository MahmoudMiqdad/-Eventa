
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:eventa_project/color.dart';
import 'package:eventa_project/view/screen/public_event/cubit/cubit.dart';
import 'package:eventa_project/view/screen/public_event/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AttendanceListScreen extends ConsumerWidget {
  const AttendanceListScreen({required this.event_id, super.key});
final int event_id;
  @override
  Widget build(BuildContext context,WidgetRef ref ) {
    

    return  BlocProvider(
        create: (context) => publiceventCubit()..getattendpublic(event_id:event_id),
        child: BlocConsumer<publiceventCubit, publicStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var attendevent = publiceventCubit.get(context);

            return Scaffold(
      appBar: AppBar(
        title: const Text('Event Attendance', style: TextStyle(color: Colors.white)),
      ),
                body: ConditionalBuilder(
                    condition: state is! PublicInitialState,
                    builder: (context) => ListView.separated(
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                                        children: [
                                          ListTile(
                                            
                                            leading: CircleAvatar(
                                              backgroundImage: AssetImage("assets/images/logo.png"),
                                            ),
                                            title: Text(attendevent.attendevent[index].firstName +attendevent.attendevent[index].lastName),
                                            subtitle: Text('Seats Reserved: ${attendevent.attendevent[index].pivot.ticketsCount}'),
                                            trailing: Text('Price: ${attendevent.attendevent[index].pivot.totalPrice}'),
                                          ),
                                            const Divider(height: 0.5
                                            ,color:Appcolor.grey )
                                        ],
                                      );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(
                            height: 20,
                          ),
                          itemCount: attendevent.attendevent.length,
                        ),
                    fallback: (context) => const Center(
                          child: CircularProgressIndicator(),
                        )));
          },
        ));
  }
}
