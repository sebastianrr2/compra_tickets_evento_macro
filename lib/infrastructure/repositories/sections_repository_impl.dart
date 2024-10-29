

import 'package:compra_tickets_evento_macro/domain/datasources/sections_datasource.dart';
import 'package:compra_tickets_evento_macro/domain/entities/section.dart';
import 'package:compra_tickets_evento_macro/domain/repositories/section_repository.dart';

class SectionsRepositoryImpl extends SectionRepository {


  final SectionsDatasource datasource;

  SectionsRepositoryImpl(this.datasource);


  @override
  Future<String> getImageLocationSections() {
    return datasource.getImageLocationSections();
  }

  @override
  Future<List<double>> getPricing(int id) {
    return datasource.getPricing(id);
  }

  @override
  Future<Section> getSectionById(int id) {
    return datasource.getSectionById(id);
  }

  @override
  Future<List<Section>> getSections(int eventId) {
    return datasource.getSections(eventId);
  }

  @override
  Future<bool> isSectionAvailable(Section section){
    return datasource.isSectionAvailable(section);
  }


  
}