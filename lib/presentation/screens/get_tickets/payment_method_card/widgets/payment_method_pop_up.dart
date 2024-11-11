import 'package:compra_tickets_evento_macro/presentation/providers/payment_card_provider.dart';
import 'package:compra_tickets_evento_macro/presentation/screens/get_tickets/payment_method_card/widgets/cards_list_view.dart';
import 'package:compra_tickets_evento_macro/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:compra_tickets_evento_macro/presentation/theme/app_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class PaymentMethodPopUp extends StatelessWidget {
  final String _heroPaymentMethodCard = 'payment-method-card-hero';

  const PaymentMethodPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Hero(
        tag: _heroPaymentMethodCard,
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: 350,
            decoration: BoxDecoration(
              color: AppTheme.dullGold,
              borderRadius: BorderRadius.circular(15),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    "PAYMENT METHOD",
                    style: ThemeStylesSettings.primaryTitleWhite,
                  ),
                  const SizedBox(height: 10),
                  const Divider(color: AppTheme.jet, thickness: 5, indent: 0, endIndent: 0, height: 0,),
                  
                  // PaymentMethodList - ajustado para no tener espacio
                  const PaymentMethodList(),
                  
                  // Botón de añadir nuevo método de pago - sin espacio con el Divider
                  InkWell(
                    onTap: () {
                      context.push("/form_input_card_payment_method");
                    },
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      color: AppTheme.lightGray,
                      child: const Center(
                        child: Text(
                          "ADD NEW PAYMENT METHOD",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  
                  const Divider(color: AppTheme.jet, thickness: 5, indent: 0, endIndent: 0, height: 0,),
                  
                  // Botón de "PAGAR" con InkWell
                  InkWell(
                    onTap: () {
                      // Acción para proceder con el pago
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      decoration: BoxDecoration(
                        color: AppTheme.dullGold,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "PAGAR",
                            style: ThemeStylesSettings.primaryTitleWhite,
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: AppTheme.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


