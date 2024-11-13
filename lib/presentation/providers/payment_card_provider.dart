import 'package:compra_tickets_evento_macro/domain/entities/payment_card.dart';
import 'package:compra_tickets_evento_macro/infrastructure/repositories/cards_repository_impl.dart';
import 'package:flutter/material.dart';


class CardProvider with ChangeNotifier {
  final CardsRepositoryImpl cardRepository;

  // Store the cards in a list
  List<PaymentCard> cards = [];

  CardProvider({required this.cardRepository});


  Future<void> createCard(PaymentCard card) async {
    await cardRepository.createCard(card);
    cards.add(card);
    notifyListeners(); // Notify listeners to update the UI
  }

  Future<PaymentCard?> readCard(int id) async {
    final card = await cardRepository.readCard(id);
    return card;
  }

  Future<void> updateCard(PaymentCard card) async {
    await cardRepository.updateCard(card);
    final index = cards.indexWhere((c) => c.id == card.id);
    if (index != -1) {
      cards[index] = card;
      notifyListeners(); // Notify listeners to update the UI
    }
  }

  Future<void> deleteCard(int id) async {
    await cardRepository.deleteCard(id);
    cards.removeWhere((card) => card.id == id);
    notifyListeners(); // Notify listeners to update the UI
  }

  Future<void> fetchAllCards() async {
    cards = await cardRepository.fetchAllCards();
    notifyListeners(); // Notify listeners to update the UI
  }

   void toggleCard(PaymentCard card) {
    final index = cards.indexWhere((c) => c.id == card.id);
    if (index != -1) {
      cards[index].isActive = !cards[index].isActive; // Toggle the isActive state
      notifyListeners();
    }
  }
}