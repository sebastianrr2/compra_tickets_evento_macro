import '../entities/event.dart';

abstract class EventRepository {

  Future<Event> getEventById(int id);

  Future<List<Event>> getAllEvents();
  
  Future<Event> getEventGeneralInfo(int id);
}
