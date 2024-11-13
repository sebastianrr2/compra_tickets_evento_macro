

import 'package:compra_tickets_evento_macro/domain/entities/payment_card.dart';

abstract class CardDatasource {
  
  Future<void> createCard(PaymentCard card);

  Future<PaymentCard?> readCard(int id);

  Future<void> updateCard(PaymentCard card);
 
  Future<void> deleteCard(int id);
  
  Future<List<PaymentCard>> fetchAllCards();


}