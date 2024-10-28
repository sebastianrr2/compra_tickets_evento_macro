


import 'package:compra_tickets_evento_macro/domain/datasources/sections_datasource.dart';
import 'package:compra_tickets_evento_macro/domain/entities/section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SectionsDbDatasource extends SectionsDatasource {

  late List<Section> demoSections;

  Section demoSection1 = Section(
    id: 0, 
    eventId: 0, 
    name: "Palco Garrix", 
    maxCapacity: 10);

  Section demoSection2 = Section(
    id: 1, 
    eventId: 0, 
    name: "Dance floor", 
    maxCapacity: 10);

  Section demoSection3 = Section(
    id: 2, 
    eventId: 0, 
    name: "We are your friends", 
    maxCapacity: 10);

  Section demoSection4 = Section(
    id: 3, 
    eventId: 0, 
    name: "Backstage", 
    maxCapacity: 10);

  Section demoSection5 = Section(
    id: 4, 
    eventId: 0, 
    name: "Palco beats", 
    maxCapacity: 10);

  
  SectionsDbDatasource(){
  demoSections = [demoSection1, demoSection2, demoSection3, demoSection4, demoSection5];
  }

  @override
  Future<String> getImageLocationSections() async {
    // Lógica para buscar la imagen que representan las secciones
    await Future.delayed(const Duration(milliseconds: 5)); 
    String imagePath = 'assets/imagesEvents/SECTION_IMAGE.png'; // Ajusta la extensión según tu imagen
    
    // Verifica que la imagen se carga correctamente
    try {
      await rootBundle.load(imagePath);
      return imagePath; // Devuelve la ruta de la imagen en assets
    } catch (e) {
      return ''; // Retorna vacío si no se encuentra la imagen
    }
  }

  @override
  Future<List<double>> getPricing(int id) async {
    //Logica para buscar el el minimo y maximo precio de las sillas correspodientes a la seccion
    //Get precing basic logic;
    /*get_seats_by_sectionid
    get min price
    get max price*/  
    await Future.delayed(const Duration(milliseconds: 5)); 
    double minPrice = 900000;
    double maxPrice = 400000;
    return [minPrice, maxPrice];
  }

  @override
  Future<Section> getSectionById(int id) {
    
    throw UnimplementedError();
  }

  @override
  Future<List<Section>> getSections(int eventId) {
    
    throw UnimplementedError();
  }

  
}