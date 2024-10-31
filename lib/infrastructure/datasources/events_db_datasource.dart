

import 'package:compra_tickets_evento_macro/domain/datasources/events_datasource.dart';
import 'package:compra_tickets_evento_macro/domain/entities/event.dart';

class EventsDbDatasource extends EventsDatasource{

  late List<Event> demoEvents;
  //Se inicializa esta simulacion para desplegar la pantalla general del evento
  Event demoEvent = Event(
        id: 0,
        name: 'Ultra music festival', // Nombre del evento
        logo: 'https://i.pinimg.com/originals/2a/2e/a5/2a2ea5fc5819d4b41541f36d21566d8d.png', // URL del logo
        description: 'The world premier electronic music festival, boasting elite DJs and un paralleled production located in the beautiful city of Miami', // Descripción del evento
        maxCapacity: 5000, // Capacidad máxima del evento
        date: DateTime.now().add(const Duration(days: 30)), // Fecha del evento en 30 días a partir de hoy
        location: 'Bogotá, Colombia', // Ubicación del evento
        host: '@EventCorp', // Anfitrión del evento
        locationImage: 'https://www.rockymountainrep.com/wp-content/uploads/2021/11/Screen-Shot-2021-11-01-at-11.20.18-AM.png', // Imagen de la ubicación
        gallery: [
          'https://th.bing.com/th/id/R.c651640f76594994ea70721362b90c93?rik=ZQYQ5hUOSAjFiA&pid=ImgRaw&r=0',
          'https://th.bing.com/th/id/OIP.0BSL71ZSqCFIQSDgCYMJ8gHaE7?rs=1&pid=ImgDetMain',
          'https://assets.simpleviewinc.com/simpleview/image/upload/crm/miamifl/ultra-music-festival-1440x9000_27cfc50f-5056-a36a-0bbcb1d9fc8f821a.jpg',
          "https://th.bing.com/th/id/OIP.VMFWZP3M9Dr2O6ak3Eu0qgAAAA?rs=1&pid=ImgDetMain",
          "https://imagez.tmz.com/image/3e/16by9/2023/03/23/3e5cac3bce2c4100bffc58ce7d6ec216_xl.jpg"
        ], // Galería de imágenes del evento
        recommendations: {
          "trending": true,
          "last tickets": true
        }
      );
  
    EventsDbDatasource() {
      // Inicializamos la lista de eventos de demostración con el demoEvent
      demoEvents = [demoEvent];
    }

  @override
  Future<Event> getEventById(int id) async {
  // Buscamos el evento por ID en la lista demoEvents
  try {
    final event = demoEvents.firstWhere((event) => event.id == id);
    return event; // Retornamos el evento encontrado
  } catch (e) {
    // Manejo de errores si no se encuentra el evento
    throw Exception('Event with id $id not found');
  }
    }

  @override
  Future<Event> getEventGeneralInfo(int id) async {
    await Future.delayed(const Duration(seconds: 1)); 
    //retornamos el evento de demoEvents
    return getEventById(id);  
  }

  @override
  Future<List<Event>> getEvents() async {
    await Future.delayed(const Duration(seconds: 1)); 
    return demoEvents;
  }
  
}