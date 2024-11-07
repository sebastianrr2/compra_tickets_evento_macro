

import 'package:compra_tickets_evento_macro/domain/entities/payment_card.dart';

abstract class CardRepository{
  // Create a new card
  Future<void> createCard(PaymentCard card);

  // Read a card by its ID
  Future<PaymentCard?> readCard(int id);

  // Update an existing card
  Future<void> updateCard(PaymentCard card);

  // Delete a card by its ID
  Future<void> deleteCard(int id);

  // Optionally, you can add a method to fetch all cards
  Future<List<PaymentCard>> fetchAllCards();

}