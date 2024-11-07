import 'package:compra_tickets_evento_macro/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final String text;
  const CustomDivider({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
                  height: 35,
                  color: AppTheme.divider, // Background color of the Divider
                  child: Center(
                    child: Text(
                      text,
                      style: const TextStyle(
                        fontFamily: 'CormorantGaramond',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.lightGray,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ),
                );
  }
}