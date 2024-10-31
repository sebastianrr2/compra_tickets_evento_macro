import 'package:compra_tickets_evento_macro/presentation/screens/get_tickets/select_seats/widgets/complete_ticket_counter.dart';
import 'package:compra_tickets_evento_macro/presentation/theme/app_theme.dart';
import 'package:compra_tickets_evento_macro/presentation/widgets/custom_appbar.dart';
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
      body: Column(
        children: [
          // Full screen InteractiveViewer with image
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
          const SizedBox(height: 20),
        
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
                Container(
                  height: 35,
                  color: AppTheme.divider, // Background color of the Divider
                  child: const Center(
                    child: Text(
                      'CHOOSE SEATS',
                      style: TextStyle(
                        fontFamily: 'CormorantGaramond',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.lightGray,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18), 
                //COUNTER OF TICKETS
                const CompleteTicketCounter()

              ],
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


