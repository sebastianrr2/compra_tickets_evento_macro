import 'package:compra_tickets_evento_macro/presentation/providers/payment_card_provider.dart';
import 'package:compra_tickets_evento_macro/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentMethodList extends StatelessWidget {
  const PaymentMethodList({super.key});

  @override
  Widget build(BuildContext context) {
    final cardProvider = context.watch<CardProvider>();

    // Llama a fetchAllCards una sola vez, idealmente en el constructor del provider
    cardProvider.fetchAllCards();

    if (cardProvider.cards.isEmpty) {
      return const Center(
        child: Text(
          'No hay tarjetas disponibles.',
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.zero, // Sin padding en ListView
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cardProvider.cards.length,
      itemBuilder: (context, index) {
        final card = cardProvider.cards[index];
        return _buildPaymentMethod(
          cardNumber: "**** **** **** ${card.number.substring(card.number.length - 4)}",
          color: _getCardColor(card.color),
          isActive: card.isActive,
          onToggle: () {
            cardProvider.toggleCard(card);
          },
        );
      },
    );
  }

  Widget _buildPaymentMethod({
    required String cardNumber,
    required Color color,
    required bool isActive,
    required VoidCallback onToggle,
  }) {
    return Container(
      decoration: BoxDecoration(color: color),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.credit_card, color: Colors.white),
              const SizedBox(width: 15),
              Text(
                cardNumber,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
          Transform.scale(
            scale: 0.7,
            child: Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Switch(
                value: isActive,
                onChanged: (value) => onToggle(),
                activeColor: AppTheme.lowPricesChartreuse,
                inactiveTrackColor: Colors.transparent,
                inactiveThumbColor: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getCardColor(int colorCode) {
    switch (colorCode) {
      case 1:
        return AppTheme.mulberry;
      case 2:
        return AppTheme.usafaBlue;
      case 3:
        return AppTheme.oliveDrab;
      case 4:
        return AppTheme.grullo;
      default:
        return AppTheme.feldgrau;
    }
  }
}
