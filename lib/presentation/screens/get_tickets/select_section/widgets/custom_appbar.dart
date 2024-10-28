import 'package:compra_tickets_evento_macro/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 39,
      automaticallyImplyLeading: false,
      title: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios, // Icono de flecha hacia la izquierda
                color: AppTheme.lightGray,
                size: 24,
              ),
              onPressed: () {
                Navigator.pop(context); // Regresa a la pantalla anterior
              },
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: AppTheme.appBarTitle, // Logo centrado
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(39);
}

