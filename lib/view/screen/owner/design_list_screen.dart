// screens/hall_details_screen.dart
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:eventa_project/color.dart';
import 'package:eventa_project/shared/constants.dart';
import 'package:eventa_project/view/screen/owner/cubit/cubit.dart';
import 'package:eventa_project/view/screen/owner/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HallDetailsScreen extends ConsumerStatefulWidget {
  final String halls;
  final int hallsId;
  final double rating; // استقبال التقييم من الصفحة السابقة


  HallDetailsScreen({
    required this.hallsId,

    required this.halls,
    required this.rating, 
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _HallDetailsScreenState createState() => _HallDetailsScreenState();
}

class _HallDetailsScreenState extends ConsumerState<HallDetailsScreen> {
  final TextEditingController _dateController = TextEditingController();
  double _currentRating = 0.0; 

  @override
  void initState() {
    super.initState();
    _currentRating = widget.rating;
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OwnerCubit()..getDesign(hallid: widget.hallsId),
      child: BlocConsumer<OwnerCubit, OwnerStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var designs = OwnerCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                widget.halls,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            body: ConditionalBuilder(
              condition: state is! OwnerInitialState,
              builder: (context) => Column(
                children: [
                  RatingBar.builder(
                    initialRating: _currentRating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      setState(() {
                        _currentRating = rating; 
                      });
                    },
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: designs.design.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: GestureDetector(
                            onTap: (){
                              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      title: const Text(
                        'what is the date of your event?',
                        style:
                            TextStyle(color: Color(0xFF164863), fontSize: 23),
                      ),
                      content: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Container(
                                child: TextField(
                                  controller:_dateController ,
                              
                              cursorColor: const Color(0xFF164863),
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF164863)),
                                ),
                              ),
                            )),
                          )
                        ],
                      ),
                      actions: [
                        ElevatedButton(
                          child: const Text(
                           'OK',
                            style: TextStyle(
                                color: Color(0xFF164863), fontSize: 20),
                          ),
                          onPressed: () {
                           designs.Reservehall(context: context, halldesignid: designs.design[index].id.toString(), hallid: designs.design[index].hallId.toString(), date: _dateController.text);
                          },
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'colse',
                              style: TextStyle(
                                  color: Color(0xFF164863), fontSize: 20),
                            ))
                      ],
                    );
                  },
                );
                            },
                            child: Card(
                              elevation: 8,
                              shadowColor: Appcolor.mainColor,
                              margin: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(image+designs.design[index].image),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Number of chairs: ${designs.design[index].availableSeats}',
                                    style: const TextStyle(
                                      color: Appcolor.mainColor,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              fallback: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        },
      ),
    );
  }
}
