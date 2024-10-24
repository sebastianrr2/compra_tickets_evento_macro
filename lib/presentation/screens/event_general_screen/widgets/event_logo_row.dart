import 'package:compra_tickets_evento_macro/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';

class EventLogoRow extends StatelessWidget {
  final String logoUrl;

  const EventLogoRow({super.key, required this.logoUrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Línea dorada a la izquierda
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 20), // Espacio a la derecha
            child: const Divider(
              thickness: 2, // Grosor de la línea
              color:AppTheme.dullGold, // Color dorado
            ),
          ),
        ),
        // Logo del evento
        Image.network(
          logoUrl,
          width: 100, // Ancho del logo (ajústalo según sea necesario)
          height: 100, // Alto del logo (ajústalo según sea necesario)
        ),
        // Línea dorada a la derecha
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 20), // Espacio a la izquierda
            child: const Divider(
              thickness: 2, // Grosor de la línea
              color: AppTheme.dullGold, // Color dorado
            ),
          ),
        ),
      ],
    );
  }
}

