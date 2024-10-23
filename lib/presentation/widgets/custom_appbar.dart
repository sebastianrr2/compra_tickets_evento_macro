import 'package:compra_tickets_evento_macro/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 60, // Aumentamos la altura del AppBar para dar más espacio a los íconos
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: AppTheme.appBarTitle, // Logo centrado
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(top: 10, right: 10), // Ajusta los íconos a la derecha
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.chevron_right, // Representa ">"
                    color: AppTheme.lightGray,
                    size: 40, // Tamaño del ícono
                  ),
                  Icon(
                    Icons.star_rounded, // Ícono de estrella redondeada
                    color: AppTheme.dullGold,
                    size: 40, // Tamaño de la estrella
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Definimos el tamaño preferido del AppBar
  @override
  Size get preferredSize => const Size.fromHeight(70);
}
