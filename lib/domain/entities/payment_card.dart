
/// La clase `PaymentCard` representa una tarjeta de pago con detalles básicos necesarios
/// para su identificación y uso dentro de la aplicación.
///
/// Esta clase contiene propiedades como el número de tarjeta, nombre del titular, código
/// CVV, fecha de expiración y color para representar visualmente la tarjeta en la interfaz.
/// Además, incluye un estado (`isActive`) para indicar si la tarjeta está seleccionada
/// para realizar pagos activos.
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