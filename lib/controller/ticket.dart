
import 'package:eventa_project/data/model/ticket.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TicketsNotifier extends StateNotifier<List<Ticket>> {
  TicketsNotifier() : super([
    Ticket(eventName: 'Concert A', seats: 2, price: 50.0, eventDate: DateTime(2024, 6, 10)),
    Ticket(eventName: 'Concert B', seats: 1, price: 75.0, eventDate: DateTime(2024, 7, 20)),
      Ticket(eventName: 'Concert B', seats: 1, price: 75.0, eventDate: DateTime(2024, 7, 20)),
        Ticket(eventName: 'Concert B', seats: 1, price: 75.0, eventDate: DateTime(2024, 7, 20)),
          Ticket(eventName: 'Concert B', seats: 1, price: 75.0, eventDate: DateTime(2024, 7, 20)),
            Ticket(eventName: 'Concert B', seats: 1, price: 75.0, eventDate: DateTime(2024, 7, 20)),
              Ticket(eventName: 'Concert B', seats: 1, price: 75.0, eventDate: DateTime(2024, 7, 20)),
                Ticket(eventName: 'Concert B', seats: 1, price: 75.0, eventDate: DateTime(2024, 7, 20)),
                  Ticket(eventName: 'Concert B', seats: 1, price: 75.0, eventDate: DateTime(2024, 7, 20)),
                    Ticket(eventName: 'Concert B', seats: 1, price: 75.0, eventDate: DateTime(2024, 7, 20)),
                      Ticket(eventName: 'Concert B', seats: 1, price: 75.0, eventDate: DateTime(2024, 7, 20)),

  ]);

  void addTicket(Ticket ticket) {
    state = [...state, ticket];
  }
}

final ticketsProvider = StateNotifierProvider<TicketsNotifier, List<Ticket>>((ref) {
  return TicketsNotifier();
});