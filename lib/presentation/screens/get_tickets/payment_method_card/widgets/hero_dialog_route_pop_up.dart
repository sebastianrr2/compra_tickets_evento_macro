import 'package:flutter/material.dart';


//Esta clase se usa para dirigir el movieminto del pop up de las targetas

class HeroDialogRoute<T> extends PageRoute<T> {
  HeroDialogRoute({
    required WidgetBuilder builder,
    super.settings,
    super.fullscreenDialog,
  }) : _builder = builder;

  final WidgetBuilder _builder;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get maintainState => true;

  @override
  Color get barrierColor => Colors.black54;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return _builder(context);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    // Animación de deslizar de abajo hacia arriba
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1), // Comienza fuera de la pantalla, en la parte inferior
        end: Offset.zero, // Llega a la posición final
      ).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      )),
      child: child,
    );
  }

  @override
  String get barrierLabel => 'Popup dialog open';
}

