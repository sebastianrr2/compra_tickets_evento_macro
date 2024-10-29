

import 'package:compra_tickets_evento_macro/domain/datasources/seats_datasource.dart';
import 'package:compra_tickets_evento_macro/domain/entities/seat.dart';

class SeatsDbDatasource extends SeatsDatasource {
  // Suponiendo que tienes una lista global de asientos
late List<Seat> demoSeats = [
  Seat(id: 0, sectionId: 0, status: "occupied", number: 1),
  Seat(id: 1, sectionId: 0, status: "free", number: 1),
  Seat(id: 2, sectionId: 1, status: "free", number: 1),
  Seat(id: 3, sectionId: 2, status: "occupied", number: 1),
  Seat(id: 4, sectionId: 2, status: "free", number: 1),
  // Agrega más asientos según sea necesario
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