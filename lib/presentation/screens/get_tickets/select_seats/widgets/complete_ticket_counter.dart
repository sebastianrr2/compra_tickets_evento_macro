import 'package:compra_tickets_evento_macro/presentation/screens/get_tickets/select_seats/widgets/ticket_counter.dart';
import 'package:compra_tickets_evento_macro/presentation/theme/app_theme.dart';
import 'package:compra_tickets_evento_macro/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class CompleteTicketCounter extends StatelessWidget {
  const CompleteTicketCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Transform.translate(
        offset: const Offset(10, 0), // Ajusta la posición vertical para que quede encima
        child: Container(
          alignment: Alignment.center,
          width: 115,
          height: 55,
          decoration: BoxDecoration(
            color: AppTheme.dullGold,
            borderRadius: BorderRadius.circular(5),
            shape: BoxShape.rectangle,
            border: Border.all(
              color: AppTheme.dullGold,
              width: 5,
            ),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'TICKETS',
            style: ThemeStylesSettings.secondaryText.copyWith(fontSize: 17),
          ),
        ),
      ),
      // Espacio entre el contenedor y el contador
      const TicketCounter(),
    ],
                  );
  }
}