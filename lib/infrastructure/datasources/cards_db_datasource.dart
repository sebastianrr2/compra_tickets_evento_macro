import 'package:compra_tickets_evento_macro/domain/datasources/card_datasource.dart';
import 'package:compra_tickets_evento_macro/domain/entities/payment_card.dart';

class CardsDbDatasource extends CardDatasource {
  // Initialize cards as a mutable list
  final List<PaymentCard> cards;

  // Constructor
  CardsDbDatasource()
      : cards = [
          PaymentCard(
            id: 1,
            number: "4111 1111 1111 1234",
            fullName: "John Doe",
            cvv: 123,
            expiryDate: "12/25",
            color: 1,
          ),
          PaymentCard(
            id: 2,
            number: "5500 0000 0000 5678",
            fullName: "Jane Smith",
            cvv: 456,
            expiryDate: "11/24",
            color: 2,
            isActive: true
          ),
        ];

  @override
  Future<void> createCard(PaymentCard card) async {
    cards.add(card);
  }

  @override
  Future<PaymentCard?> readCard(int id) async {
    return cards.firstWhere(
      (card) => card.id == id,
      orElse: () => PaymentCard(id: 0, number: "", fullName: "", cvv: 0, expiryDate: "", color: 1, isActive: false),
    );
  }

  @override
  Future<void> updateCard(PaymentCard card) async {
    final index = cards.indexWhere((c) => c.id == card.id);
    if (index != -1) {
      cards[index] = card;
    }
  }

  @override
  Future<void> deleteCard(int id) async {
    cards.removeWhere((card) => card.id == id);
  }

  @override
  Future<List<PaymentCard>> fetchAllCards() async {
    return List.from(cards);
  }
}