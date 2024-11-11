import 'package:compra_tickets_evento_macro/infrastructure/datasources/cards_db_datasource.dart';
import 'package:compra_tickets_evento_macro/infrastructure/datasources/events_db_datasource.dart';
import 'package:compra_tickets_evento_macro/infrastructure/datasources/sections_db_datasource.dart';
import 'package:compra_tickets_evento_macro/infrastructure/repositories/cards_repository_impl.dart';
import 'package:compra_tickets_evento_macro/infrastructure/repositories/events_repository_impl.dart';
import 'package:compra_tickets_evento_macro/infrastructure/repositories/sections_repository_impl.dart';
import 'package:compra_tickets_evento_macro/presentation/providers/payment_card_provider.dart';
import 'package:compra_tickets_evento_macro/presentation/providers/providers.dart';
import 'package:compra_tickets_evento_macro/presentation/providers/section_provider.dart';
import 'package:compra_tickets_evento_macro/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_dotenv/flutter_dotenv.dart';
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


    final eventsRepository = EventsRespositoryImpl(EventsDbDatasource());
    final sectionsRespository = SectionsRepositoryImpl(SectionsDbDatasource());
    final cardRepository = CardsRepositoryImpl(CardsDbDatasource());
    //import

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
        //Provider para desplegar la informacion general del evento
        ChangeNotifierProvider(
          lazy: true,
          create: (context) => EventProvider(eventRepository: eventsRepository)
          ),
        
        ChangeNotifierProvider(
          lazy: true,
          create: (context) => SectionProvider(sectionRepository: sectionsRespository)
          ),
        ChangeNotifierProvider(
          lazy: true,
          create: (context) => CardProvider(cardRepository: cardRepository)
        )
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

