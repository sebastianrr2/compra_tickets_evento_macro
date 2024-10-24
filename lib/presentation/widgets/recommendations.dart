import 'package:flutter/material.dart';
import 'package:compra_tickets_evento_macro/presentation/theme/app_theme.dart';
import 'package:compra_tickets_evento_macro/presentation/theme/theme.dart';

// Un widget sin estado para mostrar recomendaciones basado en las propiedades de las recomendaciones
class Recommendations extends StatelessWidget {
  // Mapa con las recomendaciones, que pueden ser "trending" y "last tickets"
  final Map<String, bool> recommendationsMap;

  // Constructor del widget que recibe el mapa de recomendaciones
  const Recommendations({super.key, required this.recommendationsMap});

  @override
  Widget build(BuildContext context) {
    // Validar y crear el widget para "trending"
    Widget trendingWidget = Container();
    if (recommendationsMap["trending"] == true) {
      trendingWidget = Container(
        height: 20,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppTheme.trendingWeeblyOrange,
        ),
        child: Row(
          children: [
            const Icon(Icons.fireplace_rounded, color: Colors.black, size: 16), // Ícono de fuego
            const SizedBox(width: 5), // Espacio entre el ícono y el texto
            Center(
              child: Text(
                'Trending',
                style: ThemeStylesSettings.secondaryTextBlack,
              ),
            ),
          ],
        ),
      );
    }

    // Validar y crear el widget para "last tickets"
    Widget lastTicketsWidget = Container();
    if (recommendationsMap["last tickets"] == true) {
      lastTicketsWidget = Container(
        height: 20,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppTheme.lastTicketsLemonLime,
        ),
        child: Row(
          children: [
            const Icon(Icons.hourglass_bottom_rounded, color: Colors.black, size: 16), // Ícono de reloj de arena
            const SizedBox(width: 5), // Espacio entre el ícono y el texto
            Center(
              child: Text(
                'Last Tickets',
                style: ThemeStylesSettings.secondaryTextBlack,
              ),
            ),
          ],
        ),
      );
    }

    // Devuelve un widget `Row` que contiene solo los widgets cuyo valor sea `true`
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // Centra los widgets
      children: [
        if (recommendationsMap["trending"] == true) ...[
          trendingWidget,
          const SizedBox(width: 5), // Espacio entre trending y last tickets
        ],
        if (recommendationsMap["last tickets"] == true) lastTicketsWidget,
      ],
    );
  }
}


