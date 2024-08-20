// import 'package:flutter/material.dart';
// import 'package:get/get_connect/http/src/multipart/form_data.dart';
// import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
// import 'package:get/get_connect/http/src/response/response.dart';
// import 'package:image_picker/image_picker.dart';

// class ImageUploadScreen extends StatefulWidget {
//   @override
//   _ImageUploadScreenState createState() => _ImageUploadScreenState();
// }

// class _ImageUploadScreenState extends State<ImageUploadScreen> {
//   final ImagePicker _picker = ImagePicker();
//   XFile? _image;

//   Future<void> _pickImage() async {
//     final XFile? selectedImage = await _picker.pickImage(source: ImageSource.gallery);

//     setState(() {
//       _image = selectedImage;
//     });
//   }

//   Future<void> _uploadImage() async {
//     if (_image == null) return;

//     String uploadUrl = "YOUR_UPLOAD_URL_HERE";
//     FormData formData = FormData.fromMap({
//       "file": await MultipartFile.fromFile(_image!.path, filename: _image!.name),
//     });

//     try {
//       Response response = await Dio().post(uploadUrl, data: formData);
//       print("Upload response: ${response.data}");
//     } catch (e) {
//       print("Error uploading image: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Upload Image'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _image == null ? Text('No image selected.') : Image.file(File(_image!.path)),
//             ElevatedButton(
//               onPressed: _pickImage,
//               child: Text('Pick Image'),
//             ),
//             ElevatedButton(
//               onPressed: _uploadImage,
//               child: Text('Upload Image'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
