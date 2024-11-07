import 'package:cached_network_image/cached_network_image.dart';
import 'package:compra_tickets_evento_macro/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';

class EventLogoRow extends StatelessWidget {
  final String logoUrl;

  //Este widget es las lineas doradaas junto al logo del organizador, abajo del AppBar
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
              color: AppTheme.dullGold, 
            ),
          ),
        ),
        // Logo del evento con CachedNetworkImage
        CachedNetworkImage(
          imageUrl: logoUrl,
          width: 100, // Ancho del logo
          height: 100, // Alto del logo
          errorWidget: (context, url, error) => const Icon(Icons.error), // Icono de error si falla
        ),
        // Línea dorada a la derecha
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 20), // Espacio a la izquierda
            child: const Divider(
              thickness: 2, // Grosor de la línea
              color: AppTheme.dullGold,
            ),
          ),
        ),
      ],
    );
  }
}


