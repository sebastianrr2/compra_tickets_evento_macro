import 'package:compra_tickets_evento_macro/presentation/screens/event_general_screen/event_general_screen.dart';
import 'package:compra_tickets_evento_macro/presentation/screens/get_tickets/payment_method_card/form_input_payment_method_card.dart';
import 'package:compra_tickets_evento_macro/presentation/screens/get_tickets/select_seats/select_seats_screen.dart';
import 'package:compra_tickets_evento_macro/presentation/screens/get_tickets/select_section/select_section_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/event_general_screen/0', // Default value for eventId
  routes: [
    // Main route for EventGeneralScreen
    GoRoute(
      path: "/event_general_screen/:eventId", // Main route accepts eventId
      name: EventGeneralScreen.routerName,
      builder: (context, state) {
        final eventId = int.parse(state.pathParameters['eventId']!);
        return EventGeneralScreen(eventId: eventId);
      },
      // Sub-route for SelectSectionScreen
      routes: [
        GoRoute(
          path: "select_section",
          name: SelectSectionScreen.routerName,
          builder: (context, state) {
            final eventId = int.parse(state.pathParameters['eventId']!);
            return SelectSectionScreen(eventId: eventId); // Pass eventId
          },
          // Sub-route for SelectSeatsScreen, which now accepts sectionId
          routes: [
            GoRoute(
              path: "section/:sectionId/select_seats", // Change path to avoid conflicts
              name: SelectSeatsScreen.routerName,
              builder: (context, state) {
                final sectionId = int.parse(state.pathParameters['sectionId']!);
                return SelectSeatsScreen(sectionId: sectionId); // Pass sectionId
              },
            ),
          ],
        ),
      ],
    ),
    // New route for PaymentMethodPopUp
    /*GoRoute(
      path: "/go_to_pay_card_method",
      name: PaymentMethodPopUp.routerName,
      builder: (context, state) {
        return const PaymentMethodPopUp(); // You can add parameters if needed
      },
    ),*/
    // New route for form input card payment method
    GoRoute(
      path: "/form_input_card_payment_method",
      name: AddNewCardScreen.routerName,
      builder: (context, state){
        return const AddNewCardScreen();
      }
      )
  ],
);



