import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:week6_starter/categories/model/keyboards.dart';

class KeyboardService {

  final CollectionReference keyboardCollection = FirebaseFirestore.instance.collection('Keyboards');
  List<keyboard> _keyboardListFromSnapshot(QuerySnapshot? snapshot) {
    return snapshot!.docs.map((doc){
      return keyboard(
        keyboardName: doc.get('Name') ?? '',
        manufacturer: doc.get('Manufacturer')?? '',
        image: doc.get('Images') ?? '',
        price: doc.get('Price') ?? '0',
        RGB: doc.get('RGB') ?? '',
        modelNumber: doc.get('Model Number') ?? '',
        secondaryImage: doc.get('Secondary Image') ?? '',

      );
    }).toList();
  }


  Stream<List<keyboard>> get keyboards {
    return keyboardCollection.snapshots().map(_keyboardListFromSnapshot);
  }
}
