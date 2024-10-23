

import 'package:compra_tickets_evento_macro/domain/datasources/events_datasource.dart';
import 'package:compra_tickets_evento_macro/domain/entities/event.dart';
import 'package:compra_tickets_evento_macro/domain/repositories/event_repository.dart';

class EventsRespositoryImpl extends EventRepository{


  final EventsDatasource datasource;

  EventsRespositoryImpl(this.datasource);

  @override
  Future<List<Event>> getAllEvents() {
    // TODO: implement getAllEvents with API or DB
    return datasource.getEvents();
  }

  @override
  Future<Event> getEventById(int id) {
    // TODO: implement getEventById with API or DB
    return datasource.getEventById(id);
  }

  @override
   Future<Event> getEventGeneralInfo(int id) {
    // TODO: implement getEventGeneralInfo
    return datasource.getEventGeneralInfo(id);
  }
  
}