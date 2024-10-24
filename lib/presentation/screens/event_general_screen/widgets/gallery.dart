import 'package:compra_tickets_evento_macro/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

class ImageGallery extends StatelessWidget {
  final List<String> imageUrls; // Lista de URLs de imágenes

  const ImageGallery({
    super.key,
    required this.imageUrls,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Divider con texto en el medio
        Container(
          height: 28,
          color: AppTheme.divider, // Color de fondo del Divider
          child: const Row(
            children: [
              Expanded(child: Divider(color: AppTheme.divider)), // Espacio en blanco a la izquierda
              Text(
                style:TextStyle(
                    fontFamily: 'CormorantGaramond',
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.lightGray,
                    letterSpacing: 0.4,),
                'GALLERY', 
              ),
              Expanded(child: Divider(color: AppTheme.divider)), // Espacio en blanco a la derecha
            ],
          ),
        ),
        // Collage de imágenes
        ImageCollageWidget(imageUrls: imageUrls), // Reemplaza con tu widget de collage
      ],
    );
  }
}

// Ejemplo de cómo podría verse el widget ImageCollageWidget
class ImageCollageWidget extends StatelessWidget {
  final List<String> imageUrls;

  const ImageCollageWidget({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true, // Evita el desbordamiento
      physics: const NeverScrollableScrollPhysics(), // Evita que el GridView sea desplazable
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Número de columnas
        childAspectRatio: 1.0, // Proporción de aspecto de cada celda
      ),
      itemCount: imageUrls.length,
      itemBuilder: (context, index) {
        return Image.network(
          imageUrls[index],
          fit: BoxFit.cover, // Ajusta la imagen
        );
      },
    );
  }
}
