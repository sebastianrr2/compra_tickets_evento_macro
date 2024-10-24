class Event {

  //La clase event es la entidad correspondiente a la informacion que contiene un evento creado por un promotor,
  //en este momento la informacion que aparece es la informacion basica para su despliegue el la pantalla general del evento
  // o event_general_screen
  //GENERAL INFO 
  final int id;
  final String name;
  final String logo;
  final String description;
  final int maxCapacity; 
  final DateTime date;
  final String location;
  final String host;
  final String locationImage;
  final List<String> gallery;
  final Map<String,bool> recommendations;
  //la idea esque esten unas rec
  // Constructor GENERAL INFO
  Event({
    required this.id,
    required this.name,
    required this.logo,
    required this.description,
    required this.maxCapacity,
    required this.date,
    required this.location,
    required this.host,
    required this.locationImage,
    required this.gallery,
    required this.recommendations
  });
}
