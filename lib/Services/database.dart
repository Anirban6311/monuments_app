import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseMethods {
  static final Stream<QuerySnapshot> monumentStream =
  FirebaseFirestore.instance.collection('monuments_data').snapshots();
}

