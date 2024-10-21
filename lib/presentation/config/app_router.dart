

import 'package:compra_tickets_evento_macro/presentation/screens/event_general_screen/event_general_screen.dart';
import 'package:compra_tickets_evento_macro/presentation/screens/get_tickets/select_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/screens.dart';


final router = GoRouter(
  initialLocation: '/event_general_screen' ,
  routes: [

    GoRoute(
      path: "/event_general_screen",
      name: EventGeneralScreen.routerName,
      builder: (context, state) => const EventGeneralScreen(),

      routes: [
        GoRoute(
          path: "get_tickets",
          name: SelectSectionScreen.routerName,
          builder: (context,state) => const SelectSectionScreen()
          ),

      ]
    )
  ]);