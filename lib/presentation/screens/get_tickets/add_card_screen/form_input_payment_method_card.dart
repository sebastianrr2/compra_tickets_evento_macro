import 'package:compra_tickets_evento_macro/domain/entities/payment_card.dart';
import 'package:compra_tickets_evento_macro/presentation/providers/payment_card_provider.dart';
import 'package:compra_tickets_evento_macro/presentation/screens/event_general_screen/widgets/custom_appbar.dart';
import 'package:compra_tickets_evento_macro/presentation/theme/app_theme.dart';
import 'package:compra_tickets_evento_macro/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


//Screen completa de agregar una targeta de pago

class AddNewCardScreen extends StatefulWidget {
  static const String routerName = "form_input_card_payment_method";

  const AddNewCardScreen({super.key});

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController expiryController = TextEditingController();
  int selectedColor = 1; // Color inicial de la tarjeta

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
        return AppTheme.feldgrau; // Color por defecto
    }
  }


  void _saveCard() async {
    final cardProvider = Provider.of<CardProvider>(context, listen: false);

    // Convertimos el CVV a int
    final int cvv = int.tryParse(cvvController.text) ?? 0;

    final newCard = PaymentCard(
      id: DateTime.now().millisecondsSinceEpoch,
      number: cardNumberController.text,
      fullName: nameController.text,
      cvv: cvv,
      expiryDate: expiryController.text,
      color: selectedColor,
    );

    await cardProvider.createCard(newCard);

    if (mounted) {
      // Si sigue montado, regresa a la pantalla anterior
      Navigator.of(context).pop();
    }
  }


  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: const CustomAppbar(),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            
            // Tarjeta simulada que cambia de color
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: _getCardColor(selectedColor),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            const SizedBox(height: 20),
            Form(
              child: Column(
                children: [
                  _buildTextField(
                    controller: cardNumberController,
                    hintText: "Card number",
                    icon: Icons.credit_card,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(19),
                    ],
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    controller: nameController,
                    hintText: "Full name",
                    icon: Icons.person,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildTextField(
                          controller: cvvController,
                          hintText: "CVV",
                          icon: Icons.lock,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4),
                          ],
                        ),
                      ),       
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildTextField(
                          controller: expiryController,
                          hintText: "MM/YY",
                          icon: Icons.calendar_today,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(5),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            // Botones de color
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(5, (index) {
                int colorCode = index + 1;
                return GestureDetector(
                  onTap: () => setState(() => selectedColor = colorCode),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: _getCardColor(colorCode),
                      shape: BoxShape.circle,
                    ),
                  ),
                );
              }),
            ),   
            const SizedBox(height: 30),  
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 12),
                  backgroundColor: Colors.transparent,
                  side: const BorderSide(color: AppTheme.lightGray, width: 0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () async {
                  _saveCard();
                  if (mounted) {
                    Navigator.of(context).pop(); // Navegar si el widget sigue montado
                  }
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.add_card,
                      color: AppTheme.lightGray,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Add card",
                      style: TextStyle(
                        color: AppTheme.lightGray,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


  Widget _buildTextField({
    TextEditingController? controller,
    required String hintText,
    required IconData icon,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF282828),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: ThemeStylesSettings.primaryText.apply(color: AppTheme.battleshipGray),
          icon: Icon(icon, color: AppTheme.battleshipGray),
          border: InputBorder.none,
        ),
        style: ThemeStylesSettings.primaryText.apply(color: Colors.white),
      ),
    );
  }
}





