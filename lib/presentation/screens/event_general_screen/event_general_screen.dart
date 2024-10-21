import 'package:compra_tickets_evento_macro/presentation/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/services.dart';
import 'package:compra_tickets_evento_macro/presentation/theme/app_theme.dart';

import "../screens.dart";

class EventGeneralScreen extends StatelessWidget {
  static const String routerName = "event_general_screen";

  const EventGeneralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomAppbar();
  }
}




