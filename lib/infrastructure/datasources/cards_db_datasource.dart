import 'package:compra_tickets_evento_macro/domain/datasources/card_datasource.dart';
import 'package:compra_tickets_evento_macro/domain/entities/payment_card.dart';

class CardsDbDatasource extends CardDatasource {
  final List<PaymentCard> _cards = [];

  @override
  Future<void> createCard(PaymentCard card) async {
    _cards.add(card);
  }

  @override
  Future<PaymentCard?> readCard(int id) async {
    return _cards.firstWhere((card) => card.id == id, orElse: () => PaymentCard(id: 0, number: 
    "", fullName: "", cvv: 0, expiryDate: ""));
  }

  @override
  Future<void> updateCard(PaymentCard card) async {
    final index = _cards.indexWhere((c) => c.id == card.id);
    if (index != -1) {
      _cards[index] = card;
    }
  }

  @override
  Future<void> deleteCard(int id) async {
    _cards.removeWhere((card) => card.id == id);
  }

  @override
  Future<List<PaymentCard>> fetchAllCards() async {
    return List.from(_cards);
  }
}