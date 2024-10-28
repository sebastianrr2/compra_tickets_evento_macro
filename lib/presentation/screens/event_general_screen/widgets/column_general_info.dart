import 'package:cached_network_image/cached_network_image.dart';
import 'package:compra_tickets_evento_macro/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../theme/theme.dart';

class ColumnGeneralInfo extends StatelessWidget {
  final int maxCapacity;
  final DateTime date;
  final String location;
  final String host;
  final String locationImage;

  const ColumnGeneralInfo({
    super.key,
    required this.maxCapacity,
    required this.date,
    required this.location,
    required this.host,
    required this.locationImage,
  });

  String _formatDate(DateTime date) {
    return DateFormat('MMM. d yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0), // Margen adicional para evitar desbordes
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Parte izquierda: Información del evento
          Expanded(
            flex: 7, // Ajusta el tamaño al 70%
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.person, size: 15, color: AppTheme.grullo),
                    const SizedBox(width: 8),
                    Text(maxCapacity.toString(), style: ThemeStylesSettings.secondaryText),
                  ],
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 15, color: AppTheme.feldgrau),
                    const SizedBox(width: 8),
                    Text(_formatDate(date), style: ThemeStylesSettings.secondaryText),
                  ],
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 15, color: AppTheme.usafaBlue),
                    const SizedBox(width: 8),
                    Text(location, style: ThemeStylesSettings.secondaryText),
                  ],
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    const Icon(Icons.public, size: 15, color: AppTheme.dullGold),
                    const SizedBox(width: 8),
                    Text(
                      host,
                      style: ThemeStylesSettings.secondaryTextGold,
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    const Icon(Icons.people_alt, size: 15, color: AppTheme.mulberry),
                    const SizedBox(width: 8),
                    Text(
                      "10 friends have tickets",
                      style: ThemeStylesSettings.secondaryText,
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Parte derecha: Imagen usando CachedNetworkImage
          Expanded(
            flex: 5, // Ajusta el tamaño al 30%
            child: Container(
              constraints: const BoxConstraints(
                maxHeight: 200,
                maxWidth: 200, // Altura máxima de la imagen (ajustar según sea necesario)
              ),
              child: CachedNetworkImage(
                imageUrl: locationImage,
                fit: BoxFit.cover,
                placeholder: (context, url) => const CircularProgressIndicator(color: AppTheme.dullGold), // Indicador de carga
                errorWidget: (context, url, error) => const Icon(Icons.error), // Icono de error si falla
              ),
            ),
          ),
        ],
      ),
    );
  }
}






