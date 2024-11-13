import 'package:compra_tickets_evento_macro/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';

class GetTicketsButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GetTicketsButton({super.key, required this.onPressed});
  //Boton amarillo de get tickets

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.dullGold, // Color dullGold para el botón
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12), // Tamaño del botón
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Bordes redondeados
        ),
      ),
      onPressed: onPressed, // Acción al presionar el botón
      child: const Text(
        'GET TICKETS',
        style: TextStyle(
          fontFamily: 'CormorantGaramond', // Tipografía del título
          fontSize: 16, // Tamaño del texto del botón
          fontWeight: FontWeight.bold, // Negrita para el botón
          color: AppTheme.textColor, // Texto en color negro
        ),
      ),
    );
  }
}
