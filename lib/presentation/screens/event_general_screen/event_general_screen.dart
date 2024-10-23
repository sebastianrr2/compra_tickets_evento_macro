import 'package:compra_tickets_evento_macro/presentation/providers/providers.dart';
import 'package:compra_tickets_evento_macro/presentation/theme/app_theme.dart';
import 'package:compra_tickets_evento_macro/presentation/widgets/custom_appbar.dart';
import 'package:compra_tickets_evento_macro/presentation/widgets/event_logo_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/event.dart';

class EventGeneralScreen extends StatelessWidget {
  static const String routerName = "event_general_screen";

  final int eventId; // ID del evento que se pasa al constructor

  const EventGeneralScreen({
    super.key,
    required this.eventId, // Aseguramos que el ID sea requerido
  });

  @override
  Widget build(BuildContext context) {
    // Obtenemos el provider
    final eventProvider = context.read<EventProvider>();

    return Scaffold(
      appBar: const CustomAppbar(),
      body: FutureBuilder<Event>(
        future: eventProvider.getEventGeneralInfo(eventId), // Llama a la función para obtener el evento
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Muestra un indicador de carga mientras se espera
            return const Center(child: CircularProgressIndicator(color: AppTheme.dullGold,));
          } else if (snapshot.hasError) {
            // Maneja el error
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            // Una vez que los datos están disponibles
            final event = snapshot.data!;
            final logoUrl = event.logo; // Obtener el logo del evento

            return Column(
              children: [
                EventLogoRow(logoUrl: logoUrl), // Usar la fila con el logo
                // Otras partes de la interfaz, como la descripción, la ubicación, etc.
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        event.name.toUpperCase(),
                         style: const TextStyle(
                          fontFamily: 'CormorantGaramond', // Aplicar la fuente
                          fontSize: 20, // Tamaño del texto
                          fontWeight: FontWeight.bold, // Hacerlo negrita
                          color: AppTheme.textColor, 
                        )
                      ),
                      Text(
                        event.description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'JosefinSans', // Mantener la fuente de la descripción
                          fontSize: 16,
                          color: AppTheme.textColor, // Color del texto según tu tema
                        ),
                      ),
                    ],)
                ),
                // Agrega más widgets aquí según sea necesario
              ],
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}






