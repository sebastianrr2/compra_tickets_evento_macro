import 'package:compra_tickets_evento_macro/presentation/providers/section_provider.dart';
import 'package:compra_tickets_evento_macro/presentation/widgets/custom_appbar.dart';
import 'package:compra_tickets_evento_macro/presentation/screens/get_tickets/select_section_screen/widgets/list_view_sections.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectSectionScreen extends StatelessWidget {
  static const String routerName = "select_section_screen";
  final int eventId;

  const SelectSectionScreen({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    final sectionProvider = context.read<SectionProvider>();

    return Scaffold(
      appBar: const CustomAppbar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double containerHeight = constraints.maxHeight * 0.4;

          return FutureBuilder<String>(
            future: sectionProvider.getImageSections(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                final imagePath = snapshot.data!;

                return Column(
                  children: [
                    SizedBox(
                      height: containerHeight,
                      child: Center(
                        child: Image.asset(imagePath),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ListViewSections(eventId: eventId), // Pasando `eventId` a ListViewSections
                  ],
                );
              } else {
                return const Center(child: Text('No data available'));
              }
            },
          );
        },
      ),
    );
  }
}



