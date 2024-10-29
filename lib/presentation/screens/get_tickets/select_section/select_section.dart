import 'package:compra_tickets_evento_macro/presentation/screens/get_tickets/select_section/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/services.dart';
import 'package:compra_tickets_evento_macro/presentation/theme/app_theme.dart';






class SelectSectionScreen extends StatelessWidget {

  static const String routerName = "select_section_screen";
  const SelectSectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(),
    );
  }
}