import 'package:flutter/material.dart';

import 'app_theme.dart';

class ThemeStyles {
  static TextStyle primaryTitle = const TextStyle(
    fontFamily: 'JosefinSans',
    fontSize: 18,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    height: 30/(18 + 2)
  );

  static TextStyle primaryTitleDate = const TextStyle(
    fontFamily: 'JosefinSans',
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: AppTheme.lightGray,
    letterSpacing: 0.4,
  );

  static TextStyle appBarTitle = const TextStyle(
    fontFamily: 'CormorantGaramond',
    fontSize: 40,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.25,
    color: AppTheme.lightGray
  );

  static TextStyle trailingLeading = const TextStyle(
    fontFamily: 'JosefinSans',
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppTheme.battleshipGray,
    letterSpacing: 0.4,
  );

  static TextStyle primaryTitleSnackbar = const TextStyle(
    fontFamily: 'JosefinSans',
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppTheme.lightGray,
    letterSpacing: 0.4,
  );

  static TextStyle primaryTitleSnackbariOS = const TextStyle(
    fontFamily: 'JosefinSans',
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppTheme.black,
    letterSpacing: 0.4,
  );

  static TextStyle primaryContentSnackbar = const TextStyle(
    fontFamily: 'JosefinSans',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppTheme.lightGray,
    letterSpacing: 0.4,
  );

  static TextStyle primaryTitleButton = const TextStyle(
    fontFamily: 'JosefinSans',
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppTheme.lightGray,
    letterSpacing: 0.4,
    height: 30/(18 + 2)
  );

  static TextStyle primaryTitleBottomSheet = const TextStyle(
    fontFamily: 'CormorantGaramond',
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: AppTheme.black,
    letterSpacing: 0.4,
  );

  static TextStyle primaryTextBottomSheet = const TextStyle(
    fontFamily: 'JosefinSans',
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppTheme.black,
    letterSpacing: 0.4,
  );

  static TextStyle primaryTextCardNumber = const TextStyle(
    fontFamily: 'JosefinSans',
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppTheme.lightGray,
    letterSpacing: 0.4,
  );

  static TextStyle primaryTitleShoppingCart = const TextStyle(
    fontFamily: 'CormorantGaramond',
    fontSize: 23,
    fontWeight: FontWeight.w500,
    color: AppTheme.lightGray,
    letterSpacing: 0.5,
  );

  static TextStyle primaryTitleShoppingCartDullGold = const TextStyle(
    fontFamily: 'CormorantGaramond',
    fontSize: 23,
    fontWeight: FontWeight.w500,
    color: AppTheme.dullGold,
    letterSpacing: 0.5,
  );

  static TextStyle primaryNumberShoppingCart = const TextStyle(
    fontFamily: 'JosefinSans',
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: AppTheme.white,
    letterSpacing: 0.0,
  );

  static TextStyle primaryNumberShoppingCartDullGold = const TextStyle(
    fontFamily: 'JosefinSans',
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: AppTheme.dullGold,
    letterSpacing: 0.0,
  );

  static TextStyle primaryTitleCreditCard = const TextStyle(
    fontFamily: 'JosefinSans',
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: AppTheme.black,
    letterSpacing: 0.4,
    height: 30/(18 + 2)
  );

  static TextStyle primaryTextCreditCard = const TextStyle(
    fontFamily: 'JosefinSans',
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: AppTheme.black,
    letterSpacing: 0.4,
    height: 0.9
  );

  static TextStyle primaryTitleCreditCardA = const TextStyle(
    fontFamily: 'JosefinSans',
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppTheme.black,
    letterSpacing: 0.4,
    height: 30/(18 + 2)
  );
  
  static TextStyle primaryTitleCreditCardB = const TextStyle(
    fontFamily: 'JosefinSans',
    fontSize: 22,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
    color: AppTheme.black,
    letterSpacing: 0.4,
    height: 30/(18 + 2)
  );

  static const TextStyle primaryTextFormField = TextStyle( 
    fontFamily: 'CormorantGaramond',
    fontSize: 19,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.15,
    color: AppTheme.white,
  );

  static const TextStyle primaryTextFormFieldJosefin = TextStyle( 
    fontFamily: 'JosefinSans',
    fontSize: 16,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.15,
    color: AppTheme.lightGray,
  );

  static const TextStyle primaryTextFormFieldNumber = TextStyle( 
    fontFamily: 'JosefinSans',
    fontSize: 15,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.15,
    color: AppTheme.lightGray,
  );
}