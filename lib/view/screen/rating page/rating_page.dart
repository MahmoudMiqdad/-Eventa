
import 'package:eventa_project/color.dart';
import 'package:eventa_project/model/rating_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RatingPage extends ConsumerWidget {
  const RatingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ratingModel = ref.watch(ratingProvider);
    final ratingNotifier = ref.read(ratingProvider.notifier);

    return Scaffold(
      appBar: AppBar(
          elevation: 40,
        backgroundColor: Appcolor.appBar,
        iconTheme:const IconThemeData(color: Appcolor.white),
        title: const Text('Enter your Rating',style: TextStyle(color: Appcolor.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
    
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 1,),

            Expanded(
              child: Container(
               
                decoration: const BoxDecoration(
               
                  image: DecorationImage(image: AssetImage('assets/images/eventa1.jpg'),fit: BoxFit.cover)
                  ),
              ),
            ),
                        
            const SizedBox(height: 40),

            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Rating',
              ),
              onChanged: (value) {
                ratingNotifier.setRating(value);
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Rating entered: ${ratingModel.rating}'),
                  ),
                );
              },
              style: ButtonStyle(
                  fixedSize: WidgetStateProperty.all(const Size(200, 60)),
                 overlayColor: WidgetStateProperty.all( const Color.fromARGB(255, 5, 24, 168)),
                  backgroundColor: WidgetStateProperty.all(const Color(0xFF5669ff)),
                ),
              child: const Text('Send',style: TextStyle(color: Appcolor.white,fontSize: 25),),
            ),
             const Spacer(flex: 2,),
          ],
        ),
      ),
    );
  }
}


