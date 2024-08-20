
import 'dart:typed_data';

import 'package:eventa_project/shared/dio_helper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

void showToast({
  required BuildContext context,
  required String text,         
  required Color color,        
  int duration = 3,
}) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER, 
    timeInSecForIosWeb: duration, 
    backgroundColor: color, 
    textColor: Colors.white, 
    fontSize: 16.0,
  );
}

navigateAndFinish(context, Widget widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
    (Route<dynamic> route) => false,
  );
}





// class AddDietsController extends GetxController {
//   var description = ''.obs;
//   var time = ''.obs;
//   var dayId = 0;
//   late Uint8List fileBytes;
//   var isLoading = false.obs;
//   var imagePath ;

//   final AddDeitsService _addDeitsService = AddDeitsService();

//   Future<void> pickImage() async {
//     try {
//       final result = await FilePicker.platform.pickFiles(type: FileType.any);
//       if (result != null && result.files.isNotEmpty) {
//         fileBytes = result.files.first.bytes!;
//         final fileName = result.files.first.name;
//         print('File selected: $fileName');
//       } else {
//         print("No file selected or file is empty");
//       }
//     } catch (e) {
//       print("Error picking file: $e");
//     }
//   }

//   void addDiet() async {
//     if (description.value.isNotEmpty && time.value.isNotEmpty) {
//       isLoading.value = true;
//       print('In addDiet');
//       DeitsModel deitsModel = DeitsModel(
//         time: time.value,
//         day_id: dayId,
//         description: description.value,
//         image: fileBytes, // Pass the Uint8List to the model
//       );
//       print('In addDiet2');
//       bool success = await _addDeitsService.deits(deitsModel);
//       isLoading.value = false;
//       if (success) {
//         Get.snackbar('Success', 'Diet added successfully');
//         description.value = '';
//         time.value = '';
//         //imagePath.value = null;
//       } else {
//         Get.snackbar('Error', 'Failed to add diet');
//       }
//     } else {
//       Get.snackbar('Error', 'Please fill all fields and select an image');
//     }
//   }
// }


// class DeitsModel {
//   final String time;
//   final int day_id;
//   final String description;
//   final dynamic image;
//   final int? id;

//   DeitsModel(
//       {required this.time,
//       required this.day_id,
//       required this.description,
//       required this.image,
//       this.id});

//   Map<String, dynamic> toJson() {
//     return {
//       'time': time,
//       'day_id': day_id,
//       'description': description,
//       'image': image,
//       'id': id
//     };
//   }

//   factory DeitsModel.fromJson(Map<String, dynamic> json) {
//     return DeitsModel(
//         time: json['time'],
//         day_id: json['day_id'],
//         description: json['description'],
//         image: json['image'],
//         id: json['id']);
//   }
// }


//                 //   SizedBox(
//                 //   width: 225,
//                 //   child: MaterialButton(
//                 //     shape: RoundedRectangleBorder(
//                 //       borderRadius: BorderRadius.circular(15),
//                 //     ),
//                 //     padding: const EdgeInsets.all(15),
//                 //     minWidth: 400,
//                 //     color: const Color.fromARGB(255, 49, 0, 71),
//                 //     child: const Text(
//                 //       'Add Image',
//                 //       style: TextStyle(
//                 //         fontSize: 20,
//                 //         fontWeight: FontWeight.w700,
//                 //         color: Color.fromARGB(255, 161, 153, 153),
//                 //       ),
//                 //     ),
//                 //     onPressed: () async {
//                 //       addDietsController.pickImage();
//                 //     },
//                 //   ),
//                 // ),


// class AddDeitsService {
//   Future<bool> deits(DeitsModel deitsModel) async {
//     try {
//       var response = await DioHelper.add_deits(
//         time: deitsModel.time,
//         day_id: deitsModel.day_id,
//         description: deitsModel.description,
//         image: deitsModel.image,
//       );
//       if (response.statusCode == 200) {
//         return true;
//       } else {
//         print('Error response: ${response.data}');
//         return false;
//       }
//     } catch (error) {
//       print('Service error: $error');
//       return false;
//     }
//   }
// }