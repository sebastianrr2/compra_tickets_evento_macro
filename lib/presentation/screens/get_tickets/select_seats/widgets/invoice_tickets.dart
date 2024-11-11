
import 'package:compra_tickets_evento_macro/domain/entities/seat.dart';
import 'package:compra_tickets_evento_macro/domain/entities/section.dart';
import 'package:compra_tickets_evento_macro/presentation/screens/get_tickets/select_seats/widgets/go_to_pay_button.dart';
import 'package:compra_tickets_evento_macro/presentation/theme/app_theme.dart';
import 'package:compra_tickets_evento_macro/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class InvoiceTickets extends StatelessWidget {
  final Section section;
  final List<Seat> seats;

  const InvoiceTickets({
    super.key,
    required this.section,
    required this.seats,
  });

  @override
Widget build(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Generamos la lista de tickets
      ...List.generate(seats.length, (index) {
        final seat = seats[index];
        return Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "x1 ${section.name} Ticket",
                    style: ThemeStylesSettings.secondaryTitleTextForm,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32),
                    child: Text(
                      "S. ${seat.number}",
                      style: ThemeStylesSettings.secondaryText.apply(color: AppTheme.mulberry),
                    ),
                  ),
                ],
              ),
              Text(
                "\$${seat.price.toStringAsFixed(3)}",
                style: ThemeStylesSettings.primaryText.apply(color: AppTheme.white),
              ),
            ],
          ),
        );
      }),
      const SizedBox(height: 15),
      // Divider ubicado debajo de la lista generada
      const Divider(
        color: AppTheme.lightGray, // Color de la línea
        thickness: 1.0,             // Grosor de la línea
        indent: 8,                  // Sin espacio al inicio
        endIndent: 8,               // Sin espacio al final
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Columna de títulos
        Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Alinea los textos a la izquierda
          children: [
            Text(
              "SUBTOTAL",
              style: ThemeStylesSettings.secondaryTitleTextForm,
            ),
            Text(
              "TAX(10%)",
              style: ThemeStylesSettings.secondaryTitleTextForm,
            ),
            const SizedBox(height: 10),
            Text(
              "TOTAL",
              style: ThemeStylesSettings.secondaryTitleTextForm.apply(color: AppTheme.dullGold),
            ),
          ],
        ),
        // Columna de valores
      Column(
          crossAxisAlignment: CrossAxisAlignment.end, // Alinea los textos a la derecha
          children: [
            // Cálculo del subtotal
            Text(
              "\$${_calculateSubtotal().toStringAsFixed(3)}",
              style: ThemeStylesSettings.primaryText.apply(color: AppTheme.white),
            ),
            // Cálculo del impuesto (10% del subtotal)
            const SizedBox(height: 5),
            Text(
              "\$${_calculateTax().toStringAsFixed(3)}",
              style: ThemeStylesSettings.primaryText.apply(color: AppTheme.white),
            ),
            // Cálculo del total (subtotal + impuesto)
            const SizedBox(height: 15),
            Text(
              "\$${_calculateTotal().toStringAsFixed(3)}",
              style: ThemeStylesSettings.primaryText.apply(color: AppTheme.dullGold),
                  ),
                ],
              ),
            ],
          ),
        ),
    ],
  );
}
double _calculateSubtotal() {
  return seats.fold(0.0, (sum, seat) => sum + seat.price);
}

double _calculateTax() {
  return _calculateSubtotal() * 0.10;
}

double _calculateTotal() {
  return _calculateSubtotal() + _calculateTax();
}

}

