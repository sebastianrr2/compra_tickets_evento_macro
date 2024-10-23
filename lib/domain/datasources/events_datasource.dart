import '../entities/event.dart';



abstract class EventsDatasource {

 Future<Event> getEventById(int id);
  
 Future<List<Event>> getEvents();

 Future<Event> getEventGeneralInfo(int id);


  }