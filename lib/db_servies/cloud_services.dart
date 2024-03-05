// ignore_for_file: use_build_context_synchronously
import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rent_fix/models/models.dart';
import 'package:rent_fix/utils/app_utils.dart';
import 'package:rent_fix/widgets/custom_snackbar.dart';
import '../constants/constants.dart';
import 'db_servies.dart';

class CloudServices {
  static final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  static CollectionReference getPropertyCollection() {
    var collection = _fireStore.collection('properties_data');
    return collection;
  }

  static Future<List<PropertyModel>> fetchAllPropertyDetails() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection('properties_data').get();

      List<PropertyModel> propertyList = [];

      for (QueryDocumentSnapshot<Map<String, dynamic>> document
          in querySnapshot.docs) {
        Map<String, dynamic> mapData = document.data();
        PropertyModel property = PropertyModel.fromMap(mapData);
        propertyList.add(property);
      }

      return propertyList;
    } catch (e) {
      // print("Error fetching property details: $e");
      return [];
    }
  }

  static Future<DocumentSnapshot> fetchUserData() async {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    DocumentSnapshot propertySnapshot =
        await _fireStore.collection('user_data').doc(uid).get();
    return propertySnapshot;
  }

  static Future<void> uploadPropertyDataToFirebase({
    required BuildContext context,
    required PropertyModel propertyModel,
  }) async {
    try {
      String? uid = FirebaseAuth.instance.currentUser?.uid;
      List<String> imageUrls = [];

      for (String image in propertyModel.images) {
        final storageReference = FirebaseStorage.instance.ref().child(
            'property_image/$uid/${DateTime.now().microsecondsSinceEpoch}');
        await storageReference.putFile(File(image));
        final imageUrl = await storageReference.getDownloadURL();
        imageUrls.add(imageUrl);
      }

      propertyModel.images = imageUrls;
      propertyModel.id = DateTime.now().millisecondsSinceEpoch.toString() +
          Random().nextInt(999).toString();
      propertyModel.propertyListDate =
          AppUtils.formatDateWithoutTime(DateTime.now());
      await _fireStore
          .collection('properties_data')
          .add(propertyModel.toJson());

      CustomSnackBar.show(
        context: context,
        text: 'Uploaded data Successfully',
        backgroundColor: AppColors.turquoise,
      );

      AppUtils.hideCircularIndicator(context);
      Navigator.of(context).pop();
    } catch (error) {
      AppUtils.hideCircularIndicator(context);

      if (error is HttpException ||
          error is SocketException ||
          error is FormatException) {
        ErrorHandling.handleErrors(error: error);
      } else {
        rethrow;
      }
    }
  }

  static Future<void> uploadOfferDataToFirebase({
    required BuildContext context,
    required OfferModel offerModel,
  }) async {
    try {
      await _fireStore.collection('offer_data').add(offerModel.toJson());

      CustomSnackBar.show(
        context: context,
        text: 'Send data Successfully',
        backgroundColor: AppColors.turquoise,
      );
      AppUtils.hideCircularIndicator(context);
      Navigator.of(context).pop();

      ///  Navigator.of(context) .popUntil((route) => route.settings.name == AppRoutes.homeScreen);
    } catch (error) {
      AppUtils.hideCircularIndicator(context);
      if (error is HttpException ||
          error is SocketException ||
          error is FormatException) {
        ErrorHandling.handleErrors(error: error);
      } else {
        rethrow;
      }
    }
  }
}
