import 'package:compra_tickets_evento_macro/presentation/providers/section_provider.dart';
import 'package:compra_tickets_evento_macro/presentation/screens/get_tickets/select_seats/select_seats_screen.dart';
import 'package:compra_tickets_evento_macro/presentation/theme/app_theme.dart';
import 'package:compra_tickets_evento_macro/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SectionButtons extends StatelessWidget {
  final int sectionId;
  const SectionButtons({super.key, required this.sectionId});

  Color _getColorForSection(int sectionId, bool isAvailable) {
    // Define a list of colors
    List<Color> colors = [
      AppTheme.usafaBlue,      // Color for sectionId % 4 == 1
      AppTheme.dullGold,       // Color for sectionId % 4 == 2
      AppTheme.mulberry,       // Color for sectionId % 4 == 3
      // Add more colors if needed
    ];

    // If the section is not available, return a gray color
    if (!isAvailable) return AppTheme.battleshipGray;

    // Use modulus to wrap around the colors list
    return colors[sectionId % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    final sectionProvider = context.read<SectionProvider>();

    return FutureBuilder<Map<String, dynamic>>(
      future: sectionProvider.getSectionDetails(sectionId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final sectionData = snapshot.data!;
          final sectionName = sectionData['name'];
          final minPrice = sectionData['minPrice'];
          final maxPrice = sectionData['maxPrice'];
          final isAvailable = sectionData['isAvailable'];
          final buttonColor = _getColorForSection(sectionId, isAvailable);

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 160,
                height: 30,
                child: TextButton(
                  onPressed: isAvailable
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SelectSeatsScreen(sectionId: sectionId),
                            ),
                          );
                        }
                      : null, // Disable button if not available
                  style: TextButton.styleFrom(
                    backgroundColor: buttonColor,
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    minimumSize: const Size(0, 0),
                  ),
                  child: Center(
                    child: Text(
                      sectionName,
                      textAlign: TextAlign.center,
                      style: ThemeStylesSettings.secondaryText.copyWith(fontSize: 15).copyWith(
                        color: isAvailable ? AppTheme.lightGray : AppTheme.darkRed, // Red text for unavailable sections
                      ),
                    ),
                  ),
                ),
              ),
              if (isAvailable) ...[
                Text(
                  minPrice == maxPrice 
                    ? '$minPrice COP' 
                    : '$minPrice to $maxPrice COP',
                  style: ThemeStylesSettings.secondaryText,
                ),
              
              ],
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

