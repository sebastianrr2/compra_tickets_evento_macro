import 'package:compra_tickets_evento_macro/domain/datasources/card_datasource.dart';
import 'package:compra_tickets_evento_macro/domain/entities/payment_card.dart';

class CardsRepositoryImpl {


  final CardDatasource datasource;

  CardsRepositoryImpl(this.datasource);

  
  Future<void> createCard(PaymentCard card) async {
    await datasource.createCard(card);
  }

  
  Future<PaymentCard?> readCard(int id) async {
    return await datasource.readCard(id);
  }


  Future<void> updateCard(PaymentCard card) async {
    await datasource.updateCard(card);
  }

  
  Future<void> deleteCard(int id) async {
    await datasource.deleteCard(id);
  }

 
  Future<List<PaymentCard>> fetchAllCards() async {
    return await datasource.fetchAllCards();
  }
}
