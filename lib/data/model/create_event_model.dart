import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class Event {
  final String name;
  final File? image;
  final String description;
  final String dateTime;
  final int seats;
  final double price;
  final String? category;

  Event( {
    required this.name,
    this.image,
    required this.description,
    required this.dateTime,
    required this.seats,
    required this.price,
    required this.category,
  });
}

class EventNotifier extends StateNotifier<Event> {
  EventNotifier()
      : super(Event(
          description: '',
          dateTime: '',
          seats: 0,
          price: 0.0,
          category: null,
           name: '',
        ));

  final picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      state = Event(
        image: File(pickedFile.path),
        description: state.description,
        dateTime: state.dateTime,
        seats: state.seats,
        price: state.price,
        category: state.category,
         name:state.name,
      );
    }
  }
  void setnName(String description) {
    state = Event(
      image: state.image,
       name:state.name,
      description: description,
      dateTime: state.dateTime,
      seats: state.seats,
      price: state.price,

      category: state.category,
    );
  }

  void setDescription(String description) {
    state = Event(

      image: state.image,
       name:state.name,
      description: description,
      dateTime: state.dateTime,
      seats: state.seats,
      price: state.price,

      category: state.category,
    );
  }

  void setDateTime(String dateTime) {
    state = Event(
      image: state.image,
       name:state.name,
      description: state.description,
      dateTime: dateTime,
      seats: state.seats,
      price: state.price,
      category: state.category,
    );
  }

  void setSeats(int seats) {
    state = Event(
      image: state.image,
       name:state.name,
      description: state.description,
      dateTime: state.dateTime,
      seats: seats,
      price: state.price,
      category: state.category,
    );
  }

  void setPrice(double price) {
    state = Event(
      image: state.image,
       name:state.name,
      description: state.description,
      dateTime: state.dateTime,
      seats: state.seats,
      price: price,
      category: state.category,
    );
  }

  void setCategory(String? category) {
    state = Event(
      image: state.image,
       name:state.name,
      description: state.description,
      dateTime: state.dateTime,
      seats: state.seats,
      price: state.price,
      category: category,
    );
  }
}

final eventProvider = StateNotifierProvider<EventNotifier, Event>((ref) {
  return EventNotifier();
});
