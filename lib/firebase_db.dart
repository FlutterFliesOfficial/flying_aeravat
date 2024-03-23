import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:vega/models/company.dart';
// import 'package:vega/models/myevents.dart';

const String COLLECTION_REF = 'env1';
// const String COLLECTION_REF_COMPANY = 'company';

class DBservEvents {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _dbRef;

  DBservEvents() {
    _dbRef = _firestore.collection(COLLECTION_REF);
  }
  // .withConverter<myEvents>(
  //     fromFirestore: (snapshot, _) => myEvents.fromJson(snapshot.data()!),
  //     toFirestore: (myEvents, _) => myEvents.toJson());

  Stream<QuerySnapshot> getEvents() {
    return _dbRef.snapshots();
  }

  // void addEvent(myEvents event) async {
  //   _eventsRef.add(event);
  // }
}
