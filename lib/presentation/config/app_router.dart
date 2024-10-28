import 'package:compra_tickets_evento_macro/presentation/screens/event_general_screen/event_general_screen.dart';
import 'package:compra_tickets_evento_macro/presentation/screens/get_tickets/select_section/select_section.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/event_general_screen/0', // El 0 es un valor por defecto, luego se reemplazara con el ID real
  routes: [
    /*En la pantalla de la lista de los eventos el id del evento del que se quiere desplegar se sacaria con:
    context.pushNamed(
  EventGeneralScreen.routerName,
  pathParameters: {'eventId': '5'}, // Aquí pasas el id como string
);
*/ 

    // Definimos una ruta para la pantalla de eventos con un parámetro eventId
    GoRoute(
      path: "/event_general_screen/:eventId", // La ruta acepta un parámetro dinámico :eventId
      name: EventGeneralScreen.routerName,
      builder: (context, state) {
        final eventId = int.parse(state.pathParameters['eventId']!); // Tomamos el parámetro de la URL
        return EventGeneralScreen(eventId: eventId); // Lo pasamos a la pantalla
      },
      // Sub-rutas
      routes: [
        GoRoute(
          path: "get_tickets",
          name: SelectSectionScreen.routerName,
          builder: (context,state) => const SelectSectionScreen(),
        ),
      ],
    ),
  ],
);
