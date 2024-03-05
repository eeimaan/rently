import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants/constants.dart';

class OfferModel {
  String rentAggrement;
  int rent;
  String date;

  OfferModel({
    required this.rentAggrement,
    required this.rent,
    required this.date,
  });

  factory OfferModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    DateTime date = (data['available_date'] as Timestamp).toDate();

    return OfferModel(
      rentAggrement: data['rent_aggrement'] ?? '',
      rent: data['monthly_rent'] ?? '',
      date: date.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      AppText.rentAggrement: rentAggrement,
      'monthly_rent': rent,
      'available_date': date,
    };
  }
}
