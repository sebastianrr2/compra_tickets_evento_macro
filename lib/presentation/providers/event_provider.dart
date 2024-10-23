

part of 'providers.dart';


class EventProvider with ChangeNotifier {
  final EventRepository eventRepository; // Instancia de la fuente de datos
  Event? _currentEvent; // Evento actual seleccionado

  //#TODO: CACHE
  List<Event> _events = []; // Lista de eventos

  EventProvider({required this.eventRepository});

  // Obtener la información general del evento por ID
  Future<Event> getEventGeneralInfo(int id) async {
    final event = await eventRepository.getEventGeneralInfo(id);
    _currentEvent = event;
    notifyListeners(); // Notificar a los listeners de los cambios
    return event;
  }

  // Obtener todos los eventos
  Future<void> getEvents() async {
    _events = await eventRepository.getAllEvents();
    notifyListeners();
  }

  // Obtener el evento actual seleccionado
  Event? get currentEvent => _currentEvent;

  // Establecer el evento actual
  void setCurrentEvent(Event event) {
    _currentEvent = event;
    notifyListeners();
  }

  // Obtener la lista de eventos
  List<Event> get events => _events;

  // Refrescar la lista de eventos
  Future<void> refreshEvents() async {
    await getEvents(); // Cargar nuevamente los eventos
  }
}
