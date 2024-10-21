part of 'theme.dart';

class ThemeStylesProfiles {

  Color? color;
  final double? fontSize;

  ThemeStylesProfiles({this.color = AppTheme.lightGray, this.fontSize = 20});

   late TextStyle primaryTitle = TextStyle(
    fontFamily: 'CormorantGaramond',
    fontSize: fontSize,
    fontWeight: FontWeight.bold,
    color: color,
    letterSpacing: 0.4,
  );

  late TextStyle secondaryTitle = TextStyle(
    fontFamily: 'JosefinSans',
    fontSize: fontSize,
    fontWeight: FontWeight.normal,
    color: color,
    letterSpacing: 0.4,
  );

  late TextStyle primaryNumber = TextStyle(
    fontFamily: 'JosefinSans',
    fontSize: 25,
    fontWeight: FontWeight.w500,
    color: color,
    letterSpacing: 0.4,
  );

  late TextStyle tertiaryTitle = TextStyle(
    fontFamily: 'JosefinSans',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: color,
    letterSpacing: 0.4,
  );

  TextStyle changeTextColor({
    required Color color, 
    String? fontFamily = 'CormorantGaramond',
    FontWeight? fontWeight = FontWeight.bold}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: 0.4,
    );
  }
}