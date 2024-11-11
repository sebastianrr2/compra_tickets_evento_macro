import 'package:compra_tickets_evento_macro/domain/entities/seat.dart';
import 'package:compra_tickets_evento_macro/domain/entities/section.dart';
import 'package:compra_tickets_evento_macro/presentation/screens/get_tickets/select_seats/widgets/complete_ticket_counter.dart';
import 'package:compra_tickets_evento_macro/presentation/screens/get_tickets/select_seats/widgets/go_to_pay_button.dart';
import 'package:compra_tickets_evento_macro/presentation/screens/get_tickets/select_seats/widgets/invoice_tickets.dart';
import 'package:compra_tickets_evento_macro/presentation/screens/get_tickets/select_seats/widgets/seat_number_container.dart';
import 'package:compra_tickets_evento_macro/presentation/theme/app_theme.dart';
import 'package:compra_tickets_evento_macro/presentation/theme/theme.dart';
import 'package:compra_tickets_evento_macro/presentation/widgets/custom_appbar.dart';
import 'package:compra_tickets_evento_macro/presentation/widgets/custom_divider.dart';
import 'package:flutter/material.dart';

class SelectSeatsScreen extends StatelessWidget {
  static const String routerName = "select_seats_screen";

  const SelectSeatsScreen({super.key, required this.sectionId});

  final int sectionId;
  

  @override
  Widget build(BuildContext context) {
    // Define colors for the icons
    Color availableColor = AppTheme.mulberry;
    Color selectedColor = AppTheme.dullGold;
    Color soldOutColor = AppTheme.lightGray;

    return Scaffold(
      appBar: const CustomAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Interactive image that will be hidden when scrolling to the bottom
            InteractiveViewer(
              panEnabled: true,
              boundaryMargin: const EdgeInsets.all(100),
              minScale: 1.0,
              maxScale: 4.0,
              child: Image.asset(
                'assets/demoImages/SEAT_IMAGE.png',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildStatusIndicator(availableColor, "available"),
                const SizedBox(width: 16.0),
                _buildStatusIndicator(selectedColor, "selected"),
                const SizedBox(width: 16.0),
                _buildStatusIndicator(soldOutColor, "sold Out"),
              ],
            ),
            const SizedBox(height: 20), // Space between the row and the container
            const CustomDivider(text: "CHOOSE SEATS"),
            const SizedBox(height: 18), 
            // COUNTER OF TICKETS
            const CompleteTicketCounter(),
            Container(
              alignment: Alignment.center,
              width: 180,
              height: 55,
              child: Text(
                'number of tickets is limited to 10 tickets per customer',
                style: ThemeStylesSettings.secondaryText,
                textAlign: TextAlign.center
              ),
            ),
            const SeatNumberContainer(seatNumbers: ["11A", "11B", "12G"]),
            const SizedBox(height: 10),
            const CustomDivider(text: "INVOICE"),
            // Additional space to allow for scrolling past the invoice section
            const SizedBox(height: 10),
            InvoiceTickets(section: Section(
              id: 1, 
              eventId: 0, 
              name: "Dance floor", 
              maxCapacity: 3) , seats: [ Seat(
              id: 1,
              sectionId: 101,
              number: "11A",
              status: "available",
              price: 489.0,
                ),Seat(
                  id: 2,
                  sectionId: 101,
                  number: "11B",
                  status: "sold",
                  price: 879.0,
                ),
                Seat(
                  id: 3,
                  sectionId: 101,
                  number: "12G",
                  status: "available",
                  price: 879.0,
                )]),
            const SizedBox(height: 10),    
            const GoToPayButton()
              ],
            ),
          ),
        );
      }

  // Helper method to build the status indicator
  Widget _buildStatusIndicator(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 12.0,
          height: 12.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(width: 4.0),
        Text(label),
      ],
    );
  }
}



