import 'package:compra_tickets_evento_macro/domain/entities/seat.dart';

abstract class SeatRepository{

  Future<List<Seat>> getSeatsBySectionId(int id);
}