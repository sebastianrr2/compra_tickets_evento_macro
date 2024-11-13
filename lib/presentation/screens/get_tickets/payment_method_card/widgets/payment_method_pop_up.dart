import 'package:compra_tickets_evento_macro/presentation/screens/get_tickets/payment_method_card/widgets/cards_list_view.dart';
import 'package:compra_tickets_evento_macro/presentation/theme/app_theme.dart';
import 'package:compra_tickets_evento_macro/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class PaymentMethodPopUp extends StatefulWidget {
  final String _heroPaymentMethodCard = 'payment-method-card-hero';

  const PaymentMethodPopUp({super.key});

  @override
  State<PaymentMethodPopUp> createState() => _PaymentMethodPopUpState();
}

class _PaymentMethodPopUpState extends State<PaymentMethodPopUp> {
  final LocalAuthentication auth = LocalAuthentication();
  bool isAuthenticating = false;
  bool paymentSuccessful = false;

  Future<void> authenticateAndPay() async {
    try {
      final authenticated = await auth.authenticate(
        localizedReason: 'Authenticate to complete the payment',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );

      if (!mounted) return;

      if (authenticated) {
        setState(() {
          paymentSuccessful = true;
        });

        // Mostrar el mensaje de éxito por unos segundos y luego volver al estado inicial
        await Future.delayed(const Duration(seconds: 3));
        setState(() {
          paymentSuccessful = false;
        });
      }
    } on PlatformException catch (e) {
      print("Authentication error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Hero(
        tag: widget._heroPaymentMethodCard,
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
                  Text("PAYMENT METHOD", style: ThemeStylesSettings.primaryTitleWhite),
                  const SizedBox(height: 10),
                  const Divider(color: AppTheme.jet, thickness: 5, height: 0,),
                  //Lista que despliega la targetas guardadas previamente
                  const PaymentMethodCardList(),
                  
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
                  
                  const Divider(color: AppTheme.jet, thickness: 5, height: 0),
                  
                  InkWell(
                    onTap: () {
                      authenticateAndPay();
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
                          Text("PAGAR", style: ThemeStylesSettings.primaryTitleWhite),
                          const Icon(Icons.arrow_forward_ios, color: AppTheme.white),
                        ],
                      ),
                    ),
                  ),
                  if (paymentSuccessful) ...[
                    const SizedBox(height: 20),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check_circle, size: 80, color: AppTheme.dullGold),
                        SizedBox(height: 10),
                        Text(
                          'Payment Successful',
                          style: TextStyle(color: AppTheme.dullGold, fontSize: 20),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



