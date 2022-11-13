import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:makeup/main.dart';
import 'package:makeup/model/categoryModel.dart';
import 'package:makeup/screen/category/categoryview.dart';
import 'package:makeup/screen/products/productView.dart';

class ProductService {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('Product');

  Future<List<QueryDocumentSnapshot>> getProduct() async {
    var value = await _collectionReference
        .where('category', isEqualTo: sharedPreferences!.getString('name'))
        .get();
    return value.docs;
  }
}
