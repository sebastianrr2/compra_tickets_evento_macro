import 'package:compra_tickets_evento_macro/presentation/screens/get_tickets/payment_method_card/widgets/payment_method_pop_up.dart';
import 'package:compra_tickets_evento_macro/presentation/screens/get_tickets/payment_method_card/widgets/hero_dialog_route_pop_up.dart';
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
          // Navegación para mostrar el popup
          Navigator.of(context).push(
            HeroDialogRoute(
              builder: (context) {
                return const PaymentMethodPopUp();
              },
            ),
          );
        },
        borderRadius: BorderRadius.circular(20), 
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