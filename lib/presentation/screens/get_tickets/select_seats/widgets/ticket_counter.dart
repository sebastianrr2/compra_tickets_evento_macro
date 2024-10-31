import 'package:compra_tickets_evento_macro/presentation/theme/app_theme.dart';
import 'package:customizable_counter/customizable_counter.dart';
import 'package:flutter/material.dart';

class TicketCounter extends StatelessWidget {
  const TicketCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomizableCounter(
      borderColor: AppTheme.dullGold,
      borderWidth: 3,
      decrementIcon: Icon(Icons.remove, color: AppTheme.lightGray, size: 20, ),
      incrementIcon: Icon(Icons.add, color: AppTheme.lightGray, size: 20,),
      borderRadius: 5,
      maxCount: 10,
      textSize: 25,
      textColor: AppTheme.lightGray,
      //onCountChange change something when 
    );
  }
}