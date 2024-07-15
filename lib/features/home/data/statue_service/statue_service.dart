import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/statue_model.dart';

class StatueService {
  final CollectionReference _statuesCollection =
      FirebaseFirestore.instance.collection('Statues');

  Future<List<StatueModel>> fetchStatues() async {
    try {
      QuerySnapshot snapshot = await _statuesCollection.get();
      return snapshot.docs.map((doc) {
        return StatueModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      throw Exception('Failed to fetch statues: $e');
    }
  }
}
