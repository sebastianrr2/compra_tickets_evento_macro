import 'package:compra_tickets_evento_macro/presentation/providers/providers.dart';
import 'package:compra_tickets_evento_macro/presentation/theme/app_theme.dart';
import 'package:compra_tickets_evento_macro/presentation/theme/theme.dart';
import 'package:compra_tickets_evento_macro/presentation/widgets/recommendations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../domain/entities/event.dart';
import 'widgets/column_general_info.dart';
import 'widgets/custom_appbar.dart';
import 'widgets/event_logo_row.dart';
import 'widgets/gallery.dart';
import 'widgets/get_tickets_button.dart';

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
            final logoUrl = event.logo;
            final Map<String,bool> recommendationsMap = event.recommendations; // Obtener el logo del evento
            final List<String> galleryList = event.gallery;

            return SingleChildScrollView(
              child:
                // Otras partes de la interfaz, como la descripción, la ubicación, etc. 
                Column(
                  children: [ Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        EventLogoRow(logoUrl: logoUrl), // Usar la fila con el logo
                        Text(
                          event.name.toUpperCase(),
                           style: ThemeStylesSettings.primaryTitle
                        ),
                        const SizedBox(height: 1),
                        Text(
                          event.description,
                          textAlign: TextAlign.center,
                          style: ThemeStylesSettings.secondaryText
                        ),
                        const SizedBox(height: 16), // Espacio entre la descripción y el botón
                        GetTicketsButton(
                          onPressed: () { context.push('/event_general_screen/$eventId/get_tickets');
                          },
                        ),
                        const SizedBox(height: 10),
                        Recommendations(recommendationsMap: recommendationsMap),
                        const SizedBox(height: 10),
                        // Aquí agregamos la nueva columna con la información general del evento
                        ColumnGeneralInfo(
                          maxCapacity: event.maxCapacity,
                          date: event.date,
                          location: event.location,
                          host: event.host,
                          locationImage: event.locationImage,
                        ),
                        const SizedBox(height: 10),
                      ],),           
                  ),
                // Agrega la galería de imágenes
                ImageGallery(
                        imageUrls: galleryList
                      ),],
                ),
                
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}






