import 'package:compra_tickets_evento_macro/presentation/screens/event_general_screen/event_general_screen.dart';
import 'package:compra_tickets_evento_macro/presentation/screens/get_tickets/select_seats/select_seats_screen.dart';
import 'package:compra_tickets_evento_macro/presentation/screens/get_tickets/select_section/select_section_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/event_general_screen/0', // El 0 es un valor por defecto, luego se reemplazará por el ID real
  routes: [
    // Ruta principal para `EventGeneralScreen`
    GoRoute(
      path: "/event_general_screen/:eventId", // Ruta principal acepta `eventId`
      name: EventGeneralScreen.routerName,
      builder: (context, state) {
        final eventId = int.parse(state.pathParameters['eventId']!);
        return EventGeneralScreen(eventId: eventId);
      },
      // Sub-ruta para `SelectSectionScreen`
      routes: [
        GoRoute(
          path: "select_section",
          name: SelectSectionScreen.routerName,
          builder: (context, state) {
            final eventId = int.parse(state.pathParameters['eventId']!); // Obtener eventId
            return SelectSectionScreen(eventId: eventId); // Pasa el eventId
          },
          // Sub-ruta para `SelectSeatsScreen`, que ahora acepta `sectionId`
          routes: [
            GoRoute(
              path: "section/:sectionId/select_seats", // Cambiar el path para evitar conflictos
              name: SelectSeatsScreen.routerName,
              builder: (context, state) {
                final sectionId = int.parse(state.pathParameters['sectionId']!);
                return SelectSeatsScreen(sectionId: sectionId); // Pasar sectionId
              },
            ),
          ],
        ),
      ],
    ),
  ],
);



