import 'package:compra_tickets_evento_macro/presentation/theme/app_theme.dart';
import 'package:compra_tickets_evento_macro/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class SeatNumberContainer extends StatelessWidget {
  final List<String> seatNumbers;

  const SeatNumberContainer({
    super.key,
    required this.seatNumbers,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 15, // Espacio horizontal entre contenedores
      runSpacing: 8.0, // Espacio vertical entre filas de contenedores
      children: seatNumbers.map((seatNumber) {
        return Container(
          width: 40, // Ajuste para 4 elementos por fila
          height: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppTheme.dullGold,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            seatNumber,
            style: ThemeStylesSettings.secondaryText,
            textAlign: TextAlign.center,
          ),
        );
      }).toList(),
    );
  }
}
