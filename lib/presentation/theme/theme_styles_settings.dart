
part of 'theme.dart';

class ThemeStylesSettings {

  final Color? color;

  ThemeStylesSettings({this.color = AppTheme.lightGray});


  static TextStyle primaryTitle = const TextStyle(
    fontFamily: 'CormorantGaramond',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppTheme.lightGray,
    letterSpacing: 0.4,
  );

  static TextStyle primaryTitleWhite = const TextStyle(
    fontFamily: 'CormorantGaramond',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppTheme.white,
    letterSpacing: 0.4,
  );

  static TextStyle secondaryTitle = const TextStyle(
    fontFamily: 'CormorantGaramond',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppTheme.lightGray,
    letterSpacing: 0.4,
  );

  static TextStyle secondaryTitleGold = const TextStyle(
    fontFamily: 'CormorantGaramond',
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppTheme.dullGold,
    letterSpacing: 0.4,
  );

  static TextStyle primaryText = const TextStyle(
    fontFamily: 'JosefinSans',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppTheme.lightGray,
    letterSpacing: 0.4,
  );

  static TextStyle secondaryText = const TextStyle(
    fontFamily: 'JosefinSans',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppTheme.lightGray,
    letterSpacing: 0.4,
  );

  static TextStyle primaryTitleTextForm = const TextStyle(
    fontFamily: 'CormorantGaramond',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppTheme.lightGray,
    letterSpacing: 0.4,
  );

  static TextStyle secondaryTitleTextForm = const TextStyle(
    fontFamily: 'CormorantGaramond',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppTheme.white,
    letterSpacing: 0.4,
    height: 30/(18 + 2)
  );

  TextStyle changeTextColor({Color? color = AppTheme.lightGray}) {
    return TextStyle(
      fontFamily: 'JosefinSans',
      fontSize: 18,
      fontWeight: FontWeight.w100,
      color: color,
      letterSpacing: 0.4,
    );
  }

  static TextStyle secondaryTextBlack = const TextStyle(
    fontFamily: 'JosefinSans',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppTheme.black,
    letterSpacing: 0.4,
  );

}