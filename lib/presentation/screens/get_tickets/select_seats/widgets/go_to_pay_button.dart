import 'package:compra_tickets_evento_macro/presentation/theme/app_theme.dart';
import 'package:compra_tickets_evento_macro/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class GoToPayButton extends StatelessWidget {
  const GoToPayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: InkWell(
        onTap: () {
      // Aquí colocas la lógica para el evento al hacer clic, como navegar a otra pantalla o realizar una acción
        },
        borderRadius: BorderRadius.circular(20), // Asegúrate de que el borde coincida con el del contenedor
        child: Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      decoration: BoxDecoration(
        color: AppTheme.dullGold,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "IR A PAGAR",
            style: ThemeStylesSettings.secondaryTitleTextForm.apply(color: AppTheme.white),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: AppTheme.white,
          ),
        ],
      ),
        ),
      ),
    );
  }
}