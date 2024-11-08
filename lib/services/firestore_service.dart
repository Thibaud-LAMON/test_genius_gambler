import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Récupère les données du document users dans firebase
  Future<List<Map<String, dynamic>>> getLeaderboard() async {
    final querySnapshot = await _db.collection('users')
        .orderBy('score', descending: true)
        .get();

    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }
}