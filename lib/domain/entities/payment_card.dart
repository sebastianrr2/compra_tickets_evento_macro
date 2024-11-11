


class PaymentCard {

  final int id;
  final String number;
  final String fullName;
  final int cvv;
  final String expiryDate;
  final int color;

  bool isActive;



  PaymentCard({
    required this.id,
    required this.number, 
    required this.fullName, 
    required this.cvv, 
    required this.expiryDate, 
    required this.color,
    this.isActive = false
  });
}