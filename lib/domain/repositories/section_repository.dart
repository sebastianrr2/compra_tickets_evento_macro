import 'package:compra_tickets_evento_macro/domain/entities/section.dart';



abstract class SectionRepository {

  Future<Section> getSectionById(int id);

  Future<List<Section>> getSections(int eventId);

  Future<List<double>> getPricing(int id);

  Future<String> getImageLocationSections();

}