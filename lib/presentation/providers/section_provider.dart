import 'package:compra_tickets_evento_macro/domain/entities/section.dart';
import 'package:compra_tickets_evento_macro/domain/repositories/section_repository.dart';
import 'package:flutter/material.dart';

class SectionProvider extends ChangeNotifier {
  final SectionRepository sectionRepository;

  SectionProvider({required this.sectionRepository});

  // List to hold the sections for display
  List<Section> _sections = [];
  List<Section> get sections => _sections;

  // Method to load sections based on event ID
  Future<void> loadSections(int eventId) async {
    _sections = await sectionRepository.getSections(eventId);
    notifyListeners(); // Notifica a los oyentes que los datos han cambiado
  }

  // Method to get pricing for a specific section
  Future<List<double>> getPricing(int sectionId) async {
    return await sectionRepository.getPricing(sectionId);
  }

  // Method to check availability of a specific section
  Future<bool> isSectionAvailable(int sectionId) async {
    final section = await sectionRepository.getSectionById(sectionId);
    return await sectionRepository.isSectionAvailable(section);
  }

  // Method to get section details including pricing and availability
  Future<Map<String, dynamic>> getSectionDetails(int sectionId) async {
    final section = await sectionRepository.getSectionById(sectionId);
    final pricing = await getPricing(sectionId);
    final available = await isSectionAvailable(sectionId);

    return {
      'id': section.id,
      'name': section.name,
      'minPrice': pricing[0],
      'maxPrice': pricing[1],
      'isAvailable': available,
    };
  }

  //Method to get sections image 
  Future<String> getImageSections() async {
    final imageUrl = await sectionRepository.getImageLocationSections();
    return imageUrl;
  }
}
