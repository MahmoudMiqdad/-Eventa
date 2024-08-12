
import 'package:eventa_project/color.dart';
import 'package:eventa_project/data/model/create_event_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomCreateEvent extends StatelessWidget {
  const CustomCreateEvent({super.key, required this.context, required this.eventNotifier, required this.event});
 final  BuildContext context;
 final EventNotifier eventNotifier;
 final Event event;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => BottomSheet(
                      onClosing: () {},
                      builder: (context) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text("Pleace Choose Image",style: TextStyle(fontSize: 20),),
                          ),
                          ListTile(
                            leading: const Icon(Icons.photo_library,color:Appcolor.mainColor,),
                            title: const Text('Gallery'),
                            onTap: () {
                              eventNotifier.pickImage(ImageSource.gallery);
                              Navigator.of(context).pop();
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.camera_alt,color:Appcolor.mainColor,),
                            title: const Text('Camera'),
                            onTap: () {
                              eventNotifier.pickImage(ImageSource.camera,);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: event.image == null
                    ? Container(
                        height: 150,
                        width: double.infinity,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.grey[300],),
                      
                        
                        child: Icon(
                          Icons.add_a_photo,
                          color: Colors.grey[800],
                        ),
                      )
                    : Image.file(
                        event.image!,
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
              );
  }
}