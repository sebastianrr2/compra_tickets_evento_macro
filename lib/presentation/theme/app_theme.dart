import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/* Clase abstracta que controla los colores de todos los widgets */
class AppTheme {

  static Color fillColorForm = jet.withOpacity(0.5);

  /* Paleta de colores Branding */
  static const Color backgroundTrafficBlack = Color(0XFF1E1E1E);
  static const Color usafaBlue              = Color(0XFF00558D);
  static const Color darkRed                = Color(0XFF8B0101);
  static const Color grullo                 = Color(0XFFA59586);
  static const Color jet                    = Color(0XFF312E2D);
  static const Color feldgrau               = Color(0XFF4F695D);
  static const Color dullGold               = Color(0XFFAD8330);
  static const Color vanDykeBrown           = Color(0XFF6D412A);
  static const Color lightGray              = Color(0XFFBDBDBD);
  static const Color battleshipGray         = Color(0XFF868585);
  static const Color mulberry               = Color(0XFFBA5A87);
  static const Color oliveDrab              = Color(0XFF60941A);
  static const Color white                  = Color.fromARGB(255, 255, 255, 255);
  static const Color black                  = Color.fromARGB(255, 0, 0, 0);
  static const Color divider                = Color(0XFF312E2D);
  static const Color addCardFormLetter      = Color(0x00808080);
  static const Color addCardForm            = Color(0x00282828);   

  /* Paleta de colores Map */
  static const Color trendingWeeblyOrange = Color(0XFFFF9A00);
  static const Color plus18softViolet     = Color(0XFFA16AE8);
  static const Color soldOutVenetianRed   = Color(0XFFC6020F);
  static const Color lowPricesChartreuse  = Color(0XFF01FF1F);
  static const Color friendsAttendingFluorescentBlue = Color(0XFF05E0E9);
  static const Color lastTicketsLemonLime = Color(0xFFE3FF00);

  static const Color headlineColor = lightGray;
  static const Color textColor = lightGray;
  static const Color notificationColor = backgroundTrafficBlack;
  static const Color iconColor = lightGray;
  static const Color highlightColor = dullGold;
  static const Color splashColor = dullGold;
  static const double iconSize = 35;
  static const Size sizeAppBar = Size.fromHeight(50);

  static const double fontSize40 = 40.0;
  static const double logoHeight = 350;
  static const double appBarLogoHeight = 60;
  static const double appBarLogoWidth = 60;
  
  static Align appBarTitle = Align(
          alignment: Alignment.center,
          child: Image.asset(
            'assets/logoLux1000x1000.png', 
            height: AppTheme.appBarLogoHeight, 
            width: AppTheme.appBarLogoWidth
          )
        );

  static final ThemeData lightTheme = ThemeData.light().copyWith(

      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black.withOpacity(0.0)),

      //Color primario
      primaryColor: backgroundTrafficBlack,
      scaffoldBackgroundColor: backgroundTrafficBlack,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        }
      ),

      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'CormorantGaramond',
          fontSize: 111,
          fontWeight: FontWeight.w300,
          letterSpacing: -1.5,
          color: textColor
        ),
        displayMedium: TextStyle(
          fontFamily: 'CormorantGaramond',
          fontSize: 69,
          fontWeight: FontWeight.w300,
          letterSpacing: -0.5,
          color: textColor
        ),
        displaySmall: TextStyle(
          fontFamily: 'CormorantGaramond',
          fontSize: 55,
          fontWeight: FontWeight.w400,
          color: textColor
        ),
        headlineLarge: TextStyle(
          fontFamily: 'CormorantGaramond',
          fontSize: 60,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.25,
          color: textColor
        ),
        //!Reemplazar headline1
        headlineMedium: TextStyle(
          fontFamily: 'CormorantGaramond',
          fontSize: fontSize40,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.25,
          color: textColor
        ),
        headlineSmall: TextStyle(
          fontFamily: 'CormorantGaramond',
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textColor
        ),
        titleLarge: TextStyle(
          fontFamily: 'CormorantGaramond',
          fontSize: 23,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          color: textColor
        ),
        //!Reemplazar headline4
        titleMedium: TextStyle(
          fontFamily: 'CormorantGaramond',
          fontSize: 19,
          fontWeight: FontWeight.normal,
          letterSpacing: 0.15,
          color: textColor
        ),
        //!Reemplazar headline5
        titleSmall: TextStyle(
          fontFamily: 'CormorantGaramond',
          fontSize: 16,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.1,
          color: darkRed
        ),
        //!Reemplazar headline2
        bodyLarge: TextStyle(
          fontFamily: 'JosefinSans',
          fontSize: 20,
          fontWeight: FontWeight.normal,
          letterSpacing: 0.0,
          color: white
        ),
        bodyMedium: TextStyle(
          fontFamily: 'JosefinSans',
          fontSize: 14,
          fontWeight: FontWeight.normal,
          letterSpacing: 0.25,
          color: lightGray
        ),
        labelLarge: TextStyle(
          fontFamily: 'JosefinSans',
          fontSize: 20,
          fontWeight: FontWeight.normal,
          letterSpacing: 0.0,
          color: dullGold
        ),
        bodySmall: TextStyle(
          fontFamily: 'JosefinSans',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
          color: textColor
        ),
        labelSmall: TextStyle(
          fontFamily: 'JosefinSans',
          fontSize: 8,
          fontWeight: FontWeight.normal,
          // letterSpacing: 1.5,
          color: white
        ),
      ),

      // textTheme: const TextTheme(
      //   bodyText1: TextStyle(
      //     fontFamily: 'JosefinSans',
      //     fontWeight: FontWeight.normal,
      //     fontSize: 20,
      //     color: textColor
      //   ),

      //   headline1: TextStyle(
      //     fontFamily: 'CormorantGaramond',
      //     fontWeight: FontWeight.bold,
      //     fontSize: 40,
      //     color: headlineColor
      //   ),

      //   headline2: TextStyle(
      //     fontFamily: 'JosefinSans',
      //     fontWeight: FontWeight.normal,
      //     fontSize: 20,
      //     color: headlineColor
      //   ),

      //   headline3: TextStyle(
      //     fontFamily: 'CormorantGaramond',
      //     fontWeight: FontWeight.normal,
      //     fontSize: 18,
      //     color: textColor
      //   ),

      //   /* Los siguientes headline se utilizan para dar el formato a los text form fields */
      //   //Label y hint text
      //   headline4: TextStyle(
      //     fontFamily: 'CormorantGaramond',
      //     fontWeight: FontWeight.normal,
      //     fontSize: 19,
      //     color: headlineColor
      //   ),

      //   //Error text
      //   headline5: TextStyle(
      //     fontFamily: 'CormorantGaramond',
      //     fontWeight: FontWeight.bold,
      //     fontSize: 16,
      //     color: darkRed
      //   ),
      // ),

      //AppBar Theme
      appBarTheme: const AppBarTheme(
        color: backgroundTrafficBlack,
        surfaceTintColor: backgroundTrafficBlack,
        elevation: 0,
        toolbarHeight: 50,
        iconTheme: IconThemeData(color: Colors.white, opacity: 1, size: iconSize),
        titleTextStyle: TextStyle(fontSize: 30),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: backgroundTrafficBlack,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        )
      ),

      // highlightColor: Colors.transparent,
      splashColor: highlightColor,
      hoverColor: highlightColor,

      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0,
        type: BottomNavigationBarType.shifting,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: backgroundTrafficBlack,
        unselectedItemColor: lightGray,
        selectedItemColor: dullGold,
        // selectedIconTheme: IconThemeData(color: Colors.green),
        // unselectedIconTheme: IconThemeData(color: Colors.white)
      ),

      //InputDecorationTheme
      inputDecorationTheme: const InputDecorationTheme(
        floatingLabelStyle: TextStyle(color: lightGray),
        // enabledBorder: OutlineInputBorder(
        //     borderSide: BorderSide(color: backgroundTrafficBlack),
        //     borderRadius: BorderRadius.only(
        //         bottomLeft: Radius.circular(10),
        //         topRight: Radius.circular(10))),
        // focusedBorder: OutlineInputBorder(
        //     borderSide: BorderSide(color: backgroundTrafficBlack),
        //     borderRadius: BorderRadius.only(
        //         bottomLeft: Radius.circular(10),
        //         topRight: Radius.circular(10))),
        // border: OutlineInputBorder(
        //     borderRadius: BorderRadius.only(
        //         bottomLeft: Radius.circular(10),
        //         topRight: Radius.circular(10))),
      ));

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      //Color primario
      primaryColor: backgroundTrafficBlack,

      //AppBar Theme
      appBarTheme: const AppBarTheme(
        color: backgroundTrafficBlack,
        elevation: 0,
        toolbarHeight: 80,
        iconTheme: IconThemeData(color: Colors.white, opacity: 0.8, size: 40),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: backgroundTrafficBlack,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.white);
}
