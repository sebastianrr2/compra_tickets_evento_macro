import 'package:compra_tickets_evento_macro/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'presentation/config/app_router.dart';

/* La idea de hacer el main asincrono es que se pueda llamar la inicializacion de las preferencias */
void main() async {
/* Sólo tiene que llamar a este método si necesita que la vinculación se inicialice antes de llamar a 
  runApp*/
  WidgetsFlutterBinding.ensureInitialized();

  //await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark)
    );

    SystemChrome.setPreferredOrientations([ 
      DeviceOrientation.portraitUp, 
      DeviceOrientation.portraitDown
    ]);

    return MultiProvider(
      providers: [
        // Dummy provider temporal
        Provider(create: (_) => null),
      ],


      child: MaterialApp.router(
        builder: (context, child){

          final mediaQueryData = MediaQuery.of(context);

          return MediaQuery(
            data: mediaQueryData.copyWith(
              textScaler: mediaQueryData.textScaler.clamp(minScaleFactor: 1.1, maxScaleFactor: 1.4),

            ), 
            child: child!,
          );
        },

        debugShowCheckedModeBanner: false,
        title: "compra_tickets_app",

        routerConfig: router,

        theme: AppTheme.lightTheme
      ),
    );
    
  }
}

