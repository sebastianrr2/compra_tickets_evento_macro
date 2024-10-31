

import 'package:compra_tickets_evento_macro/domain/datasources/seats_datasource.dart';
import 'package:compra_tickets_evento_macro/domain/entities/seat.dart';

class SeatsDbDatasource extends SeatsDatasource {
  // Suponiendo que tienes una lista global de asientos
late List<Seat> demoSeats = [
        // Palco Garrix
      Seat(id: 0, sectionId: 0, number: "A1", price: 120.0, status: "occupied"),
      Seat(id: 1, sectionId: 0, number: "A2", price: 130.0, status: "free"),
      Seat(id: 2, sectionId: 0, number: "A3", price: 125.0, status: "free"),

      // Dance Floor
      Seat(id: 3, sectionId: 1, number: "B1", price: 80.0, status: "free"),
      Seat(id: 4, sectionId: 1, number: "B2", price: 85.0, status: "occupied"),
      Seat(id: 5, sectionId: 1, number: "B3", price: 90.0, status: "occupied"),

      // We Are Your Friends
      Seat(id: 6, sectionId: 2, number: "C1", price: 100.0, status: "occupied"),
      Seat(id: 7, sectionId: 2, number: "C2", price: 105.0, status: "free"),
      Seat(id: 8, sectionId: 2, number: "C3", price: 110.0, status: "occupied"),

      // Backstage
      Seat(id: 9, sectionId: 3, number: "D1", price: 150.0, status: "occupied"),
      Seat(id: 10, sectionId: 3, number: "D2", price: 155.0, status: "occupied"),
      Seat(id: 11, sectionId: 3, number: "D3", price: 160.0, status: "occupied"),

      // Palco Beats
      Seat(id: 12, sectionId: 4, number: "E1", price: 110.0, status: "occupied"),
      Seat(id: 13, sectionId: 4, number: "E2", price: 115.0, status: "occupied"),
      Seat(id: 14, sectionId: 4, number: "E3", price: 120.0, status: "occupied"),
];

@override
Future<List<Seat>> getSeatsBySectionId(int id) async {
  // Filtra los asientos que pertenecen a la sección con el id dado

  final seatsInSection = demoSeats.where((seat) => seat.sectionId == id).toList();
  await Future.delayed(const Duration(milliseconds: 5)); 

  if (seatsInSection.isEmpty) {
    throw Exception('No seats found for section with id $id');
  }

  return seatsInSection;
}
}