import 'package:compra_tickets_evento_macro/domain/entities/section.dart';



abstract class SectionsDatasource {

  Future<Section> getSectionById(int id);

  Future<List<Section>> getSections(int eventId);

  Future<List<double>> getPricing(int id);

  Future<String> getImageLocationSections();

  Future<bool> isSectionAvailable(Section section);

}