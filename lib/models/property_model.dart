import 'package:cloud_firestore/cloud_firestore.dart';

class PropertyModel {
  String address;
  String name;
  int bedrooms;
  int bathrooms;
  int drawingrooms;
  int tvrooms;
  int appartmentSize;
  String propertyType;
  String rentAggrement;
  String furnishing;
  int rent;
  String date;
  String description;
  String id;
  List<String> images;
  String propertyListDate;

  PropertyModel({
    required this.name,
    required this.drawingrooms,
    required this.tvrooms,
    required this.images,
    required this.address,
    required this.bedrooms,
    required this.bathrooms,
    required this.appartmentSize,
    required this.propertyType,
    required this.rentAggrement,
    required this.furnishing,
    required this.rent,
    required this.date,
    required this.description,
    required this.id,
    required this.propertyListDate,
  });

  factory PropertyModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    DateTime date = (data['available_date'] as Timestamp).toDate();

    return PropertyModel(
      address: data['address'] ?? '',
      name: data['property_name'] ?? '',
      bedrooms: data['bedrooms'] ?? '',
      bathrooms: data['bathrooms'] ?? '',
      drawingrooms: data['drawing_rooms'] ?? '',
      tvrooms: data['tv_rooms'] ?? '',
      appartmentSize: data['appartment_size'] ?? '',
      propertyType: data['propert_type'] ?? '',
      rentAggrement: data['rent_aggrement'] ?? '',
      furnishing: data['furnishing'] ?? '',
      rent: data['monthly_rent'] ?? '',
      date: date.toString(),
      description: data['description'] ?? '',
      images: data['images'] ?? '',
      id: data['property_id'],
      propertyListDate: data['property_list_date'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'property_name': name,
      'tv_rooms': tvrooms,
      'drawing_rooms': drawingrooms,
      'address': address,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'appartment_size': appartmentSize,
      'propert_type': propertyType,
      'rent_aggrement': rentAggrement,
      'furnishing': furnishing,
      'monthly_rent': rent,
      'available_date': date,
      'description': description,
      'images': images,
      'property_id': id,
      'property_list_date': propertyListDate,
    };
  }

  factory PropertyModel.fromMap(Map<String, dynamic> data) {
    DateTime date = (data['available_date'] as Timestamp).toDate();

    return PropertyModel(
      address: data['address'] ?? '',
      name: data['property_name'] ?? '',
      bedrooms: data['bedrooms'] ?? '',
      bathrooms: data['bathrooms'] ?? '',
      drawingrooms: data['drawing_rooms'] ?? '',
      tvrooms: data['tv_rooms'] ?? '',
      appartmentSize: data['appartment_size'] ?? '',
      propertyType: data['propert_type'] ?? '',
      rentAggrement: data['rent_aggrement'] ?? '',
      furnishing: data['furnishing'] ?? '',
      rent: data['monthly_rent'] ?? '',
      date: date.toString(),
      description: data['description'] ?? '',
      images: data['images'] ?? '',
      id: data['property_id'],
      propertyListDate: data['property_list_date'] ?? '',
    );
  }
}
