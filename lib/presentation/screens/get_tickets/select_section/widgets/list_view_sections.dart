import 'package:compra_tickets_evento_macro/domain/entities/section.dart';
import 'package:compra_tickets_evento_macro/presentation/providers/section_provider.dart';
import 'package:compra_tickets_evento_macro/presentation/screens/get_tickets/select_section/widgets/section_buttons.dart';
import 'package:compra_tickets_evento_macro/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListViewSections extends StatelessWidget {
  final int eventId; // ID del evento para cargar las secciones

  const ListViewSections({super.key, required this.eventId}); // Constructor que recibe el ID del evento

  @override
  Widget build(BuildContext context) {
    final sectionProvider = context.read<SectionProvider>();

    return Column(
      mainAxisSize: MainAxisSize.min, // Define un tamaño mínimo para la columna
      children: [
        Container(
          height: 35,
          color: AppTheme.divider, // Color de fondo del Divider
          child: const Center(
            child: Text(
              'CHOOSE SECTION',
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
        const SizedBox(height: 16),
        FutureBuilder<void>(
          future: sectionProvider.loadSections(eventId), // Cargar las secciones usando el ID del evento
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Mostrar un indicador de carga mientras se esperan los datos
              return const Center(child: CircularProgressIndicator(color: AppTheme.dullGold));
            } else if (snapshot.hasError) {
              // Manejar errores de carga
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              // Mostrar la lista de secciones cargadas
              final List<Section> items = sectionProvider.sections;
              return SizedBox(
                  height: 300, // Limita la altura del ListView
                  child: ListView.builder(
                    itemCount: items.length, // Número de elementos en la lista
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10), // Adjust the vertical space as needed
                        child: SectionButtons(
                          sectionId: items[index].id, // Pasa el ID de cada sección a SectionButtons
                        ),
                      );
                    },
                  ),
                );
            }
          },
        ),
      ],
    );
  }
}






