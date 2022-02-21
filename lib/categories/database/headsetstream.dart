import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:week6_starter/categories/model/headsets.dart';

class HeadsetService {

  final CollectionReference headsetCollection = FirebaseFirestore.instance.collection('Headsets');

  List<headset> _headsetListFromSnapshot(QuerySnapshot? snapshot) {
    return snapshot!.docs.map((doc){
      return headset(
        headsetName: doc.get('Name') ?? '',
        manufacturer: doc.get('Manufacturer')?? '',
        image: doc.get('Image') ?? '',
        price: doc.get('Price') ?? '0',
        modelNumber: doc.get('Model Number') ?? '',
        connectionType: doc.get('Connection Type') ?? '',
        secondaryImage: doc.get('Secondary Image') ?? '',
      );
    }).toList();
  }


  Stream<List<headset>> get headsets {
    return headsetCollection.snapshots().map(_headsetListFromSnapshot);
  }
}
